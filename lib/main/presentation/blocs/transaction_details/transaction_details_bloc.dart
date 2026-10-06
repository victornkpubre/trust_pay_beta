import 'package:trust_pay_beta/main/presentation/base/retryable_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/repository/repositories.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_operations/bets_wager.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_operations/bill_splitter.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_operations/money_pool.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_operations/secure_sales.dart';

part 'transaction_details_event.dart';
part 'transaction_details_state.dart';
part 'transaction_details_bloc.freezed.dart';

class TransactionDetailsBloc extends Bloc<TransactionDetailsEvent, TransactionDetailsState> with RetryableBloc<TransactionDetailsEvent, TransactionDetailsState> {
  // Excluded from retry: UI-only state shuffles — never the action that failed.
  @override
  bool isRetryable(TransactionDetailsEvent event) => !(event is SetState || event is ToggleTokenVisibility || event is ToggleFulfilmentVisibility || event is TogglePayoutVisibilities || event is Init);

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
        await initiate(event, emit, repository);
      }
      if (event is SetState) {
        emit(event.state);
      }
      if (event is AddToken) {
        await addToken(event, emit, repository);
      }
      if (event is ToggleTokenVisibility) {
        await toggleTokenVisibility(event, emit, repository);
      }
      if (event is ToggleFulfilmentVisibility) {
        await toggleFulfilmentVisibility(event, emit, repository);
      }
      if (event is TogglePayoutVisibilities) {
        await togglePayoutVisibilities(event, emit, repository);
      }
      if (event is SetObligationStatus) {
        await setObligationStatusImplementation(event, emit, repository);
      }

      //Modify Transaction
      if (event is AcceptTransaction) {
        await acceptTransactionImplementation(event, emit, repository);
      }
      if (event is DeclineTransaction) {
        await declineTransactionImplementation(event, emit, repository);
      }
      if (event is PaymentTransaction) {
        await paymentTransactionImplementation(event, emit, repository);
      }
      if (event is CancelTransaction) {
        await cancelTransactionImplementation(event, emit, repository);
      }
      if (event is ExtendTransaction) {
        await extendTransactionImplementation(event, emit, repository);
      }
      if (event is ComplaintTransaction) {
        await complaintTransactionImplementation(event, emit, repository);
      }
      if (event is FulfillTransactionObligation) {
        await fulfillTransactionImplementation(event, emit, repository);
      }
      if (event is VerifyTransactionObligation) {
        await verifyTransactionImplementation(event, emit, repository);
      }
    });
  }
}

Future<void> verifyTransactionImplementation(VerifyTransactionObligation event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
  emit(event.state.copyWith(state: TransactionDetailsBlocStatus.loading));
  (await verifyTransactionByType(emit,
      event.copyWith(state: event.state.copyWith(
          state: TransactionDetailsBlocStatus.transactionUpdated
      ))
  )).fold(
  (failure) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.error,
        errorMessage: failure.message??''
    ));
  },
  (entity) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.transactionUpdated,
        transaction: entity
    ));
  });
}

Future<void> fulfillTransactionImplementation(FulfillTransactionObligation event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
  emit(event.state.copyWith(state: TransactionDetailsBlocStatus.loading));
  (await fulfillTransactionByType(emit,
    event.copyWith(state: event.state.copyWith(
      state: TransactionDetailsBlocStatus.transactionUpdated
    ))
  )).fold(
  (failure) {
    emit(event.state.copyWith(
      state: TransactionDetailsBlocStatus.error,
      errorMessage: failure.message??''
    ));
  },
  (entity) {
    emit(event.state.copyWith(
      state: TransactionDetailsBlocStatus.transactionUpdated,
      transaction: entity
    ));
  });
}

Future<void> complaintTransactionImplementation(ComplaintTransaction event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
  emit(event.state.copyWith(state: TransactionDetailsBlocStatus.loading));
  (await complaintTransactionByType(emit,
    event.copyWith(state: event.state.copyWith(
        state: TransactionDetailsBlocStatus.transactionUpdated
    ))
  )).fold(
  (failure) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.error,
        errorMessage: failure.message??''
    ));
  },
  (entity) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.transactionUpdated,
        transaction: entity
    ));
  });
}

Future<void> extendTransactionImplementation(ExtendTransaction event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
  emit(event.state.copyWith(state: TransactionDetailsBlocStatus.loading));
  (await extendTransactionByType(emit,
      event.copyWith(state: event.state.copyWith(
          state: TransactionDetailsBlocStatus.transactionUpdated
      ))
  )).fold(
  (failure) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.error,
        errorMessage: failure.message??''
    ));
  },
  (entity) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.transactionUpdated,
        transaction: entity
    ));
  });
}

Future<void> cancelTransactionImplementation(CancelTransaction event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
  emit(event.state.copyWith(state: TransactionDetailsBlocStatus.loading));
  (await cancelTransactionByType(emit,
      event.copyWith(state: event.state.copyWith(
          state: TransactionDetailsBlocStatus.transactionUpdated
      ))
  )).fold(
  (failure) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.error,
        errorMessage: failure.message??''
    ));
  },
  (entity) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.transactionUpdated,
        transaction: entity
    ));
  });
}

Future<void> paymentTransactionImplementation(PaymentTransaction event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
  print('[Payment] 2/5 Bloc received payment: transaction=${event.transaction.id} obligation=${event.obligation.id} amount=${event.obligation.amount} paymentType=${event.paymentType.name}');
  emit(event.state.copyWith(state: TransactionDetailsBlocStatus.loading));
  (await paymentTransactionByType(emit,
      event.copyWith(state: event.state.copyWith(
          state: TransactionDetailsBlocStatus.transactionUpdated
      ))
  )).fold(
  (failure) {
    final message = failure.code==442? "Account balance to low": failure.message??'';
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.error,
        errorMessage: message
    ));
  },
  (entity) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.transactionUpdated,
        transaction: entity
    ));
  });
}

Future<void> declineTransactionImplementation(DeclineTransaction event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
  emit(event.state.copyWith(state: TransactionDetailsBlocStatus.loading));
  (await declineTransactionByType(emit,
      event.copyWith(state: event.state.copyWith(
          state: TransactionDetailsBlocStatus.transactionUpdated)
      )
  )).fold(
  (failure) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.error,
        errorMessage: failure.message??''
    ));
  },
  (entity) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.transactionUpdated,
        transaction: entity
    ));
  });
}

Future<void> acceptTransactionImplementation(AcceptTransaction event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
  emit(event.state.copyWith(state: TransactionDetailsBlocStatus.loading));
  (await acceptTransactionByType(emit,
  event.copyWith(
      state: event.state.copyWith(state: TransactionDetailsBlocStatus.transactionUpdated)
  )
  )).fold(
  (failure) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.error,
        errorMessage: failure.message??''
    ));
  },
  (entity) {
    emit(event.state.copyWith(
        state: TransactionDetailsBlocStatus.transactionUpdated,
        transaction: entity
    ));
  });
}

Future<Either<Failure, Transaction>> extendTransactionByType(Emitter<TransactionDetailsState> emit, ExtendTransaction event) async {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      return extendTransactionSecureSales(event.context, emit, event);
    case TransactionType.billSplitter:
      return extendTransactionBillSplitter(event.context, emit, event);
    case TransactionType.moneyPool:
      return extendTransactionMoneyPool(event.context, emit, event);
    case TransactionType.betsWagers:
      return extendTransactionBetsWager(event.context, emit, event);
    default:
      return extendTransactionSecureSales(event.context, emit, event);
  }
}


Future<Either<Failure, Transaction>> complaintTransactionByType(Emitter<TransactionDetailsState> emit, ComplaintTransaction event) async {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      return complaintTransactionSecureSales(event.context, emit, event);
    case TransactionType.betsWagers:
      return complaintTransactionBetsWager(event.context, emit, event);
    default:
      return complaintTransactionSecureSales(event.context, emit, event);
  }
}

Future<Either<Failure, Transaction>> fulfillTransactionByType(Emitter<TransactionDetailsState> emit, FulfillTransactionObligation event) async {
  return fulfillTransactionSecureSales(event.context, emit, event);
}

Future<Either<Failure, Transaction>> verifyTransactionByType(Emitter<TransactionDetailsState> emit, VerifyTransactionObligation event) async {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      return verifyTransactionSecureSales(event.context, emit, event);
    case TransactionType.betsWagers:
      return verifyTransactionBetsWager(event.context, emit, event);
    default:
      return verifyTransactionSecureSales(event.context, emit, event);
  }
}

Future<Either<Failure, Transaction>> cancelTransactionByType(Emitter<TransactionDetailsState> emit, CancelTransaction event) async {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      return cancelTransactionSecureSales(event.context, emit, event);
    case TransactionType.billSplitter:
      return cancelTransactionBillSplitter(event.context, emit, event);
    case TransactionType.moneyPool:
      return cancelTransactionMoneyPool(event.context, emit, event);
    case TransactionType.betsWagers:
      return cancelTransactionBetsWager(event.context, emit, event);
    default:
      return cancelTransactionSecureSales(event.context, emit, event);
  }
}

Future<Either<Failure, Transaction>> paymentTransactionByType(Emitter<TransactionDetailsState> emit, PaymentTransaction event) async {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      return paymentTransactionSecureSales(event.context, emit, event);
    case TransactionType.billSplitter:
      return paymentTransactionBillSplitter(event.context, emit, event);
    case TransactionType.moneyPool:
      return paymentTransactionMoneyPool(event.context, emit, event);
    case TransactionType.betsWagers:
      return paymentTransactionBetsWager(event.context, emit, event);
    default:
      return paymentTransactionSecureSales(event.context, emit, event);
  }
}

Future<Either<Failure, Transaction>> declineTransactionByType(Emitter<TransactionDetailsState> emit, DeclineTransaction event) async {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      return declineTransactionSecureSales(event.context, emit, event);
    case TransactionType.billSplitter:
      return declineTransactionBillSplitter(event.context, emit, event);
    case TransactionType.moneyPool:
      return declineTransactionMoneyPool(event.context, emit, event);
    case TransactionType.betsWagers:
      return declineTransactionBetsWager(event.context, emit, event);
    default:
      return declineTransactionSecureSales(event.context, emit, event);
  }
}

Future<Either<Failure, Transaction>> acceptTransactionByType(Emitter<TransactionDetailsState> emit, AcceptTransaction event) async {
  switch (event.transaction.type) {
    case TransactionType.secureSales:
      return acceptTransactionSecureSales(event.context, emit, event);
    case TransactionType.billSplitter:
      return acceptTransactionBillSplitter(event.context, emit, event);
    case TransactionType.moneyPool:
      return acceptTransactionMoneyPool(event.context, emit, event);
    case TransactionType.betsWagers:
      return acceptTransactionBetsWager(event.context, emit, event);
    default:
      return acceptTransactionSecureSales(event.context, emit, event);
  }
}

Future<void> toggleFulfilmentVisibility(ToggleFulfilmentVisibility event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
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

Future<void> togglePayoutVisibilities(TogglePayoutVisibilities event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
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

Future<void> toggleTokenVisibility(ToggleTokenVisibility event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
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

Future<void> initiate(Init event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
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

Future<void> addToken(AddToken event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
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
      state: TransactionDetailsBlocStatus.tokenAdded,
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

Future<void> setObligationStatusImplementation(SetObligationStatus event, Emitter<TransactionDetailsState> emit, TransactionRepository repository) async {
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
