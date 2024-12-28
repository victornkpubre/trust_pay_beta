import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/repository/repositories.dart';

part 'transaction_details_event.dart';
part 'transaction_details_state.dart';
part 'transaction_details_bloc.freezed.dart';

class TransactionDetailsBloc extends Bloc<TransactionDetailsEvent, TransactionDetailsState> {
  final TransactionRepository repository;
  TransactionDetailsBloc(this.repository)
      : super(const _Initial(
            tokens: [],
            tokenVisibilities: [],
            payoutVisibilities: [],
            fulfilmentVisibilities: [],
            fulfilmentDates: {})) {
    on<TransactionDetailsEvent>((event, emit) async {
      if (event is Init) {
        initiate(event, emit, repository);
      }
      if (event is AddToken) {
        addToken(event, emit, repository);
      }
      if (event is ToggleTokenVisibility) {
        toggleTokenVisibility(event, emit, repository);
      }
      if (event is ToggleFulfilmentVisibility) {
        toggleFulfilmentVisibility(event, emit, repository);
      }
      if (event is TogglePayoutVisibilities) {
        togglePayoutVisibilities(event, emit, repository);
      }
      if (event is VerifyObligation) {
        verifyObligationImplementation(event, emit, repository);
      }
      if (event is SetObligationStatus) {
        setObligationStatusImplementation(event, emit, repository);
      }
    });
  }
}

void toggleFulfilmentVisibility(ToggleFulfilmentVisibility event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) {
  List<bool> fulfilmentVisibilities = [];
  for (var i = 0; i < event.state.fulfilmentVisibilities.length; i++) {
    fulfilmentVisibilities.add(event.state.fulfilmentVisibilities[i]);
    if (i == event.index) {
      fulfilmentVisibilities[i] = !event.state.fulfilmentVisibilities[i];
    } else {
      event.state.fulfilmentVisibilities[i] = false;
    }
  }
  TransactionDetailsState state = event.state.copyWith(fulfilmentVisibilities: fulfilmentVisibilities);
  emit(state);
}

void togglePayoutVisibilities(TogglePayoutVisibilities event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) {
  List<bool> payoutVisibilities = [];
  for (var i = 0; i < event.state.payoutVisibilities.length; i++) {
    payoutVisibilities.add(event.state.tokenVisibilities[i]);
    if (i == event.index) {
      payoutVisibilities[i] = !event.state.payoutVisibilities[i];
    } else {
      event.state.payoutVisibilities[i] = false;
    }
  }
  TransactionDetailsState state = event.state.copyWith(payoutVisibilities: payoutVisibilities);
  emit(state);
}

void toggleTokenVisibility(ToggleTokenVisibility event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) {
  List<bool> tokenVisibilities = [];
  for (var i = 0; i < event.state.tokenVisibilities.length; i++) {
    tokenVisibilities.add(event.state.tokenVisibilities[i]);
    if (i == event.index) {
      tokenVisibilities[i] = !event.state.tokenVisibilities[i];
    }
  }
  TransactionDetailsState state = event.state.copyWith(tokenVisibilities: tokenVisibilities);
  emit(state);
}

void initiate(Init event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) {
  List<String> tokens = event.transaction.obligations
      .where((o) {
        return o.type == ObligationType.delivery;
      })
      .toList()
      .map((o) => o.token ?? '')
      .toList();

  List<bool> tokenVisibilities = tokens.map((o) => false).toList();

  List<bool> payoutVisibilities = event.transaction.obligations
      .where((o) {
        return o.type == ObligationType.payout;
      })
      .toList()
      .map((o) => false)
      .toList();

  List<bool> fulfilmentVisibilities = event.transaction.obligations
      .where((o) {
        return o.type == ObligationType.payout;
      })
      .toList()
      .map((o) => false)
      .toList();

  Set<DateTime> fulfilmentDates = event.transaction.obligations
      .where((o) {
        return o.type == ObligationType.payout;
      })
      .toList()
      .map((o) => o.dueDate)
      .toSet();

  emit(TransactionDetailsState(
    state: TransactionDetailsBlocStatus.initiated,
    transaction: event.transaction,
    tokens: tokens,
    tokenVisibilities: tokenVisibilities,
    payoutVisibilities: payoutVisibilities,
    fulfilmentVisibilities: fulfilmentVisibilities,
    fulfilmentDates: fulfilmentDates,
  ));
}

void addToken(AddToken event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) {
  final state = event.state;
  Obligation? obligation = event.transaction.obligations.where((o) => o.id == event.id).firstOrNull;

  if(event.transaction.id == null || obligation == null) {
    emit(state.copyWith(
        state: TransactionDetailsBlocStatus.error,
        errorMessage: 'Invalid Form'
    ));
  }

  repository.setObligationToken(event.transaction.id!, obligation!, event.token);

  List<Obligation> obligations = event.transaction.obligations
      .where((o) => o.type == ObligationType.delivery)
      .toList();

  int index = obligations.indexWhere((o) => o.id == event.id);
  obligations[index] = obligations[index].copyWith(token: event.token);
  Transaction? transaction = state.transaction?.copyWith(obligations: obligations);

  emit(TransactionDetailsState(
      state: TransactionDetailsBlocStatus.transactionComplete,
      transaction: transaction,
      tokens: state.tokens,
      tokenVisibilities: state.tokenVisibilities,
      payoutVisibilities: state.payoutVisibilities,
      fulfilmentVisibilities: state.fulfilmentVisibilities,
      fulfilmentDates: state.fulfilmentDates)
  );
}

void verifyObligationImplementation(VerifyObligation event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) {
  final state = event.state;


  // emit(TransactionDetailsState(
  //     transaction: transaction,
  //     tokens: state.tokens,
  //     tokenVisibilities: state.tokenVisibilities,
  //     payoutVisibilities: state.payoutVisibilities,
  //     fulfilmentVisibilities: state.fulfilmentVisibilities,
  //     fulfilmentDates: state.fulfilmentDates)
  // );
}

void setObligationStatusImplementation(SetObligationStatus event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) {
  final state = event.state;
  Obligation? obligation = event.transaction.obligations.where((o) => o.id == event.id).firstOrNull;

  if(event.transaction.id == null || obligation == null) {
    emit(state.copyWith(
        state: TransactionDetailsBlocStatus.error,
        errorMessage: 'Invalid Form'
    ));
  }

  repository.setObligationStatus(event.transaction.id!, obligation!, event.status);


  List<Obligation> obligations = event.state.transaction?.obligations
      .where((o) => o.type == ObligationType.delivery)
      .toList()??[];

  int index = obligations.indexWhere((o) => o.id == event.id);
  obligations[index] = obligations[index].copyWith(status: ObligationStatus.verified);
  Transaction? transaction = state.transaction?.copyWith(obligations: obligations);

  emit(TransactionDetailsState(
      transaction: transaction,
      tokens: state.tokens,
      tokenVisibilities: state.tokenVisibilities,
      payoutVisibilities: state.payoutVisibilities,
      fulfilmentVisibilities: state.fulfilmentVisibilities,
      fulfilmentDates: state.fulfilmentDates)
  );
}
