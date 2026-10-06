import 'package:trust_pay_beta/main/presentation/base/retryable_bloc.dart';
import 'package:trust_pay_beta/main/data/network/error_handler.dart';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/functions/compressor.dart';
import 'package:trust_pay_beta/main/domain/functions/transaction_action_extractor.dart';
import 'package:trust_pay_beta/main/domain/repository/repositories.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/bets_wagers/widgets.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';
part 'transaction_bloc.freezed.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionBlocState> with RetryableBloc<TransactionEvent, TransactionBlocState> {
  // Excluded from retry: local-only state edits — never the network action that failed.
  @override
  bool isRetryable(TransactionEvent event) => !(event is UpdateTransactionBlocState || event is UpdateLiveTransaction || event is AddObligation || event is RemoveObligation || event is SetObligationsToken || event is SetObligationStatus);

  final TransactionRepository _repository;

  TransactionBloc(this._repository) : super(const _Initial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is LoadUserHistory) {
        await _loadUserHistory(emit, event);
      }
      if(event is GetTransaction) {
        await _getTransaction(emit, event);
      }
      if(event is CreateTransaction) {
        await _createTransaction(emit, event);
      }
      if(event is UpdateTransaction) {
        await _updateTransaction(emit, event);
      }
      if (event is SetObligationsToken) {
        await _setObligationsToken(emit, event);
      }
      if(event is SetObligationStatus) {
        await _setObligationStatus(emit, event);
      }
      if(event is NotifyMembers) {
        await _initialNotification(emit, event);
      }
      if(event is UpdateLiveTransaction) {
        await _updateLiveTransactions(emit, event);
      }
      if(event is UpdateNotification) {
        await _updateNotification(emit, event);
      }
      if(event is UpdateTransactionBlocState) {
        await _updateTransactionBlocState(emit, event);
      }
    });
  }

  Future<void> _loadUserHistory(emit, LoadUserHistory event) async {
    emit(event.state.copyWith(status: TransactionBlocStatus.loading));
    (await _repository.getUserHistory(event.id, event.pageSize, event.page)).fold(
        (failure) {
          emit(event.state.copyWith(
              status: TransactionBlocStatus.error,
              message:  failure.message
          ));
        },
        (entity) {
          List<Transaction>? liveTransactions = filterLiveTransaction(entity, event.id);
          liveTransactions.sort((tr1, tr2) => tr2.dateCreated.compareTo(tr1.dateCreated));

          emit(event.state.copyWith(
            transactionHistory: entity,
            status: TransactionBlocStatus.userHistoryLoaded,
            liveTransactions: liveTransactions
          ));
        }
    );
  }

  List<Transaction> filterLiveTransaction(List<Transaction> transactions, int currentUserId) {
    List<Transaction> list = [];
    for(final transaction in transactions) {
      TransactionActionType action = getTransactionAction(transaction, currentUserId);
      switch(action) {
        case TransactionActionType.acceptDecline:
          list.add(transaction);
          break;

        case TransactionActionType.makePayment:
          list.add(transaction);
          break;

        case TransactionActionType.fulfilObligations:
          list.add(transaction);
          break;

        case TransactionActionType.verifyObligations:
          list.add(transaction);
          break;

        case TransactionActionType.verifyMediation:
          list.add(transaction);
          break;

        default:
          print('');
      }
    }

    return list;
  }

  Future<void> _getTransaction(emit, event) async {
    emit(event.state.copyWith(status: TransactionBlocStatus.loading));
    (await _repository.getTransaction(event.id)).fold(
      (failure) {
        emit(event.state.copyWith(status: TransactionBlocStatus.error));
      },
      (entity) {
        emit(event.state.copyWith(transaction: entity, status: TransactionBlocStatus.transactionLoaded));
      }
    );
  }

  Future<void> _createTransaction(emit, CreateTransaction event) async {
    emit(event.state.copyWith(status: TransactionBlocStatus.loading));
    File? image;
    File? video;
    if(event.transaction.mediation!=null) {
      final mediation =event.transaction.mediation!;
      SourceType type = SourceType.values.firstWhere((value) {
        return value.toString().compareTo(mediation.source_type)==0;
      });
      image = type==SourceType.image? await compressImage(event.mediationSource!):null;
      video = type==SourceType.video? await compressVideo(event.mediationSource!.path):null;
    }

    (await _repository.createTransaction(event.transaction, image??video??event.mediationSource)).fold(
      (failure) {
        emit(event.state.copyWith(status: TransactionBlocStatus.error));
      },
      (entity) {
        emit(event.state.copyWith(transaction: entity, status: TransactionBlocStatus.transactionCreated));
      }
    );
  }

  Future<void> _updateTransaction(emit, UpdateTransaction event) async {
    emit(event.state.copyWith(status: TransactionBlocStatus.loading));
    (await _repository.updateTransaction(event.transaction)).fold(
      (failure) {
        emit(event.state.copyWith(status: TransactionBlocStatus.error));
      },
      (entity) {
        emit(event.state.copyWith(transaction: entity, status: TransactionBlocStatus.transactionUpdated));
      }
    );
  }

  Future<void> _setObligationsToken(emit, SetObligationsToken event) async {
    emit(event.state.copyWith(status: TransactionBlocStatus.loading));
    Obligation? obligation = event.transaction.obligations.where((o) => o.id == event.obligationId).firstOrNull;

    if(event.transaction.id == null || obligation == null) {
      emit(event.state.copyWith(status: TransactionBlocStatus.error));
    }

    (await _repository.setObligationToken(event.transaction.id!, obligation!, event.token)).fold(
      (failure) {
        emit(event.state.copyWith(status: TransactionBlocStatus.error));
      },
      (entity) {
        emit(event.state.copyWith(status: TransactionBlocStatus.obligationUpdated));
      }
    );
  }

  Future<void> _setObligationStatus(emit, SetObligationStatus event) async {
    emit(event.state.copyWith(status: TransactionBlocStatus.loading));
    Obligation? obligation = event.transaction.obligations.where((o) => o.id == event.obligationId).firstOrNull;

    if(event.transaction.id == null || obligation == null) {
      emit(event.state.copyWith(status: TransactionBlocStatus.error));
    }

    (await _repository.setObligationStatus(event.transaction.id!, obligation!, event.status)).fold(
      (failure) {
        emit(event.state.copyWith(status: TransactionBlocStatus.error));
      },
      (entity) {
        emit(event.state.copyWith(status: TransactionBlocStatus.obligationUpdated));
      }
    );
  }

  Future<void> _initialNotification(emit, NotifyMembers event) async {
    emit(event.state.copyWith(status: TransactionBlocStatus.loading));

    try {
      for(final member in event.transaction.members) {

        if(member.id != event.transaction.userId) {
          //Send notification
          final notification = Notification(
              message: event.message,
              user: event.user,
              state: NotificationState.sent,
              transaction: event.transaction,
              date: DateTime.now()
          );

          await _repository.createNotification(notification, member);
        }
      }
      emit(event.state.copyWith(status: TransactionBlocStatus.transactionUpdated));
    }
    catch(e) {
      emit(event.state.copyWith(status: TransactionBlocStatus.error, message: friendlyErrorMessage(e)));
    }
  }

  Future<void> _updateLiveTransactions(emit, UpdateLiveTransaction event) async {
    (await _repository.storeTransaction(event.transactions[0])).fold(
      (failure) {
        emit(event.state.copyWith(status: TransactionBlocStatus.error));
      },
      (entity) {
        emit(event.state.copyWith(
            transaction: event.state.transaction,
            transactionHistory: event.state.transactionHistory,
            status: TransactionBlocStatus.liveTransactionsUpdated,
            liveTransactions: event.transactions
        ));
      }
    );
  }

  Future<void> _updateNotification(emit, UpdateNotification event) async {
    (await _repository.updateNotification(event.user, event.state.transaction, event.notificationId, event.notificationState)).fold(
      (failure) {
        // emit(event.state.copyWith(status: TransactionBlocStatus.error));
      },
      (entity) {
        // emit(event.state.copyWith(
        //   transaction: event.state.transaction,
        //   transactionHistory: event.state.transactionHistory,
        //   status: TransactionBlocStatus.transactionLoaded,
        //   liveTransactions: event.state.liveTransactions
        // ));
      }
    );
  }

  Future<void> _updateTransactionBlocState(emit, UpdateTransactionBlocState event) async {
    emit(event.newState);
  }


}

