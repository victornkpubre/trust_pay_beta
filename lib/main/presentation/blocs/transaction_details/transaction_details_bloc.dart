import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/repository/repositories.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_operations/bets_wager.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_operations/bill_splitter.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_operations/money_pool.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_operations/secure_sales.dart';

part 'transaction_details_event.dart';
part 'transaction_details_state.dart';
part 'transaction_details_bloc.freezed.dart';

class TransactionDetailsBloc extends Bloc<TransactionDetailsEvent, TransactionDetailsState> {
  final TransactionRepository repository;
  TransactionDetailsBloc(this.repository): super(const _Initial(
            tokens: [],
            tokenVisibilities: [],
            payoutVisibilities: [],
            fulfilmentVisibilities: [],
            fulfilmentDates: {}
  )) {
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
      if (event is SetObligationStatus) {
        setObligationStatusImplementation(event, emit, repository);
      }
      if (event is AcceptTransaction) {
        acceptTransactionImplementation(emit, event);
      }
      if (event is DeclineTransaction) {
        declineTransactionImplementation(emit, event);
      }
      if (event is PaymentTransaction) {
        paymentTransactionImplementation(emit, event);
      }
      if (event is CancelTransaction) {
        cancelTransactionImplementation(emit, event);
      }
      if (event is ExtendTransaction) {
        extendTransactionImplementation(emit, event);
      }
      if (event is ComplaintTransaction) {
        complaintTransactionImplementation(emit, event);
      }
      if (event is FulfillTransactionObligation) {
        fulfillTransactionImplementation(emit, event);
      }
      if (event is VerifyTransactionObligation) {
        verifyTransactionImplementation(emit, event);
      }
    });
  }
}

void extendTransactionImplementation(Emitter<TransactionDetailsState> emit, ExtendTransaction event) {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      extendTransactionSecureSales(event.context, emit, event);
      break;
    case TransactionType.billSplitter:
      extendTransactionBillSplitter(event.context, emit, event);
      break;
    case TransactionType.moneyPool:
      extendTransactionMoneyPool(event.context, emit, event);
      break;
    case TransactionType.betsWagers:
      extendTransactionBetsWager(event.context, emit, event);
      break;
    default:
  }
}

void complaintTransactionImplementation(Emitter<TransactionDetailsState> emit, ComplaintTransaction event) {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      complaintTransactionSecureSales(event.context, emit, event);
      break;
    case TransactionType.billSplitter:
      break;
    case TransactionType.moneyPool:
      break;
    case TransactionType.betsWagers:
      complaintTransactionBetsWager(event.context, emit, event);
      break;
    default:
  }
}

void fulfillTransactionImplementation(Emitter<TransactionDetailsState> emit, FulfillTransactionObligation event) {
  if (event.transaction.type==TransactionType.secureSales) {
    fulfillTransactionSecureSales(event.context, emit, event);
  }
  else {
    toast(message: 'Invalid Operation');
  }
}

void verifyTransactionImplementation(Emitter<TransactionDetailsState> emit, VerifyTransactionObligation event) {
  if(event.transaction.type==TransactionType.secureSales) {
    verifyTransactionSecureSales(event.context, emit, event);
  }
  else {
    toast(message: 'Invalid Operation');
  }
}

void cancelTransactionImplementation(Emitter<TransactionDetailsState> emit, CancelTransaction event) {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      cancelTransactionSecureSales(event.context, emit, event);
      break;
    case TransactionType.billSplitter:
      cancelTransactionBillSplitter(event.context, emit, event);
      break;
    case TransactionType.moneyPool:
      cancelTransactionMoneyPool(event.context, emit, event);
      break;
    case TransactionType.betsWagers:
      cancelTransactionBetsWager(event.context, emit, event);
      break;
    default:
  }
}

void paymentTransactionImplementation(Emitter<TransactionDetailsState> emit, PaymentTransaction event) {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      paymentTransactionSecureSales(event.context, emit, event);
      break;
    case TransactionType.billSplitter:
      paymentTransactionBillSplitter(event.context, emit, event);
      break;
    case TransactionType.moneyPool:
      paymentTransactionMoneyPool(event.context, emit, event);
      break;
    case TransactionType.betsWagers:
      paymentTransactionBetsWager(event.context, emit, event);
      break;
    default:
  }
}

void declineTransactionImplementation(Emitter<TransactionDetailsState> emit, DeclineTransaction event) {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      declineTransactionSecureSales(event.context, emit, event);
      break;
    case TransactionType.billSplitter:
      declineTransactionBillSplitter(event.context, emit, event);
      break;
    case TransactionType.moneyPool:
      declineTransactionMoneyPool(event.context, emit, event);
      break;
    case TransactionType.betsWagers:
      declineTransactionBetsWager(event.context, emit, event);
      break;
    default:
  }
}

void acceptTransactionImplementation(Emitter<TransactionDetailsState> emit, AcceptTransaction event) {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      acceptTransactionSecureSales(event.context, emit, event);
      break;
    case TransactionType.billSplitter:
      acceptTransactionBillSplitter(event.context, emit, event);
      break;
    case TransactionType.moneyPool:
      acceptTransactionMoneyPool(event.context, emit, event);
      break;
    case TransactionType.betsWagers:
      acceptTransactionBetsWager(event.context, emit, event);
      break;
    default:
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

// void verifyObligationImplementation(VerifyObligation event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) {
//   final state = event.state;
//
//
//   // emit(TransactionDetailsState(
//   //     transaction: transaction,
//   //     tokens: state.tokens,
//   //     tokenVisibilities: state.tokenVisibilities,
//   //     payoutVisibilities: state.payoutVisibilities,
//   //     fulfilmentVisibilities: state.fulfilmentVisibilities,
//   //     fulfilmentDates: state.fulfilmentDates)
//   // );
// }

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
      fulfilmentDates: state.fulfilmentDates
  ));
}
