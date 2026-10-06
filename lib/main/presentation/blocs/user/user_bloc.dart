import 'package:trust_pay_beta/main/presentation/base/retryable_bloc.dart';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/functions/compressor.dart';
import 'package:trust_pay_beta/main/domain/repository/repositories.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> with RetryableBloc<UserEvent, UserState> {
  // Excluded from retry: background polling/registration — retried by their own callers.
  @override
  bool isRetryable(UserEvent event) => !(event is CheckPaymentStatus || event is SetFcmToken);

  final AppPreferences _appPreferences;
  final UserRepository _repository;

  UserBloc(this._appPreferences, this._repository) : super(_Initial()) {
    on<UserEvent>((event, emit) async {
      if (event is LoadUser) {
        emit(event.state.copyWith(status: UserBlocStatus.loading));
        (await _repository.getUser(event.id)).fold(
          (failure) {
            emit(event.state.copyWith(
                status: UserBlocStatus.error,
                message: "Error Getting User Data"
            ));
          }, 
          (entity) {
            _appPreferences.setUser(entity);
            emit(event.state.copyWith(
                user: entity,
                status: UserBlocStatus.userLoaded,
            ));
          } 
        ); 
      }

      if (event is CurrentUser) {
        emit(event.state.copyWith(status: UserBlocStatus.loading));
        User? user =  _appPreferences.getUser();
        emit(event.state.copyWith(
          user: user,
          status: UserBlocStatus.userLoaded,
          users: event.state.users,
          userSearchResults: event.state.userSearchResults
        ));
      }

      if (event is SearchUser) {
        emit(event.state.copyWith(status: UserBlocStatus.loading));
        (await _repository.searchUser(event.searchText, event.pageSize, event.page)).fold(
            (failure) {
              emit(event.state.copyWith(
                  status: UserBlocStatus.error,
                  message: "Error Searching for User"
              ));
            },
            (entity) {
              emit(event.state.copyWith(
                  user: event.state.user,
                  users: event.state.users,
                  userSearchResults: entity,
                  status: UserBlocStatus.usersLoaded
              ));
            }
        );
      }

      if (event is UpdateUser) {
        emit(event.state.copyWith(status: UserBlocStatus.loading));
        (await _repository.updateUser(event.user) ).fold(
            (failure) {
              emit(event.state.copyWith(
                  status: UserBlocStatus.error,
                  message: "Error Getting Mediator"
              ));
            },
            (entity) {
              emit(event.state.copyWith(
                  user: entity,
                  status: UserBlocStatus.userUpdate
              ));
            }
        );
      }

      if (event is UpdateUserImage) {
        emit(event.state.copyWith(status: UserBlocStatus.loading));
        final image = await compressImage(event.image);
        (await _repository.updateUserImage(event.userId, image!) ).fold(
            (failure) {
              emit(event.state.copyWith(
                  status: UserBlocStatus.error,
                  message: "Error Updating Profile Image"
              ));
            },
            (entity) {
              emit(event.state.copyWith(
                  user: entity,
                  status: UserBlocStatus.userUpdate
              ));
            }
        );
      }

      if (event is GetAllNotifications) {
        emit(event.state.copyWith(status: UserBlocStatus.loading));
        (await _repository.getUserNotifications()).fold(
            (failure) {
              emit(event.state.copyWith(
                  status: UserBlocStatus.error,
                  message: "Error Getting Notifications"
              ));
            },
            (entity) {
              emit(event.state.copyWith(
                allNotifications: entity,
                status: UserBlocStatus.notificationsLoaded
              ));
            }
        );
      }

      if (event is WalletDeposit) {
        emit(event.state.copyWith(status: UserBlocStatus.loading));
        (await _repository.deposit(event.amount, event.state.user?.id??-1)).fold(
            (failure) {
              emit(event.state.copyWith(
                  status: UserBlocStatus.error,
                  message: "Error Funding Wallet"
              ));
            },
            (entity) {
              emit(event.state.copyWith(
                user: entity,
                status: UserBlocStatus.userUpdate
              ));
            }
        );
      }

      if (event is WalletWithdraw) {
        emit(event.state.copyWith(status: UserBlocStatus.loading));
        (await _repository.withdraw(event.amount, event.state.user?.id??-1)).fold(
            (failure) {
              final message = failure.code==442? "Account balance to low": failure.message??'';
              emit(event.state.copyWith(
                status: UserBlocStatus.error,
                message: message
              ));
            },
            (entity) {
              emit(event.state.copyWith(
                  user: entity,
                  status: UserBlocStatus.userUpdate
              ));
            }
        );
      }

      if (event is GetAccounts) {
        // Builds off the bloc's own live `state`, not `event.state` (a
        // snapshot taken when this event was dispatched) — account.dart
        // fires this alongside GetAccountHistory from the same snapshot,
        // and whichever finished second would otherwise stomp the other's
        // just-emitted field back to its stale pre-dispatch value.
        (await _repository.getAccounts(event.userId)).fold(
            (failure) {
              emit(state.copyWith(
                  status: UserBlocStatus.error,
                  message: "Error Getting Wallets"
              ));
            },
            (entity) {
              emit(state.copyWith(
                  accounts: entity,
                  status: UserBlocStatus.accountsLoaded
              ));
            }
        );
      }

      if (event is InitiateDeposit) {
        emit(state.copyWith(status: UserBlocStatus.loading));
        (await _repository.initiateDeposit(event.amount, event.currency)).fold(
            (failure) {
              emit(state.copyWith(
                  status: UserBlocStatus.error,
                  message: failure.message
              ));
            },
            (entity) {
              emit(state.copyWith(
                  checkoutLink: entity.link,
                  pendingPaymentId: entity.paymentId,
                  status: UserBlocStatus.depositInitiated
              ));
            }
        );
      }

      if (event is CheckPaymentStatus) {
        (await _repository.getPaymentStatus(event.paymentId)).fold(
            (failure) {
              emit(state.copyWith(
                  status: UserBlocStatus.error,
                  message: failure.message
              ));
            },
            (entity) {
              emit(state.copyWith(
                  paymentStatus: entity,
                  status: entity.isSuccessful
                      ? UserBlocStatus.paymentSuccessful
                      : entity.isFailed
                          ? UserBlocStatus.paymentFailed
                          : UserBlocStatus.paymentPending
              ));
            }
        );
      }

      if (event is GetMediator) {
        emit(event.state.copyWith(status: UserBlocStatus.loading));
        (await _repository.getMediator(event.user, event.bettor )).fold(
          (failure) {
            emit(event.state.copyWith(
                mediator: event.user,
                status: UserBlocStatus.error,
                message: "Error Getting Mediator"
            ));
          },
          (entity) {
            emit(event.state.copyWith(
              mediator: entity,
              status: UserBlocStatus.userLoaded,
            ));
          }
        );
      }

      if (event is GetAllAccountHistory) {
        // Fetches every wallet's history and merges them into one combined,
        // date-sorted feed — each entry tagged with its own account's
        // currency so the UI can show the right symbol per payment.
        final combined = <AccountHistory>[];
        for (final account in event.accounts) {
          if (account.id == null) continue;
          (await _repository.getAccountHistory(account.id!)).fold(
            (failure) {},
            (entity) {
              combined.addAll(entity.map((h) => h.copyWith(currency: account.currency)));
            }
          );
        }
        combined.sort((a, b) => b.date.compareTo(a.date));
        emit(state.copyWith(
          accountHistory: combined,
          status: UserBlocStatus.accountHistoryLoaded,
        ));
      }

      if (event is SetFcmToken) {
        emit(event.state.copyWith(status: UserBlocStatus.loading));
        User? user =  _appPreferences.getUser();
        if(user == null) {
          emit(event.state.copyWith(
              status: UserBlocStatus.error,
              message: "Unauthenticated"
          ));
        }

        (await _repository.setFcmToken(user!, event.token)).fold(
          (failure) {
            emit(event.state.copyWith(
                status: UserBlocStatus.error,
                message: "Error Setting Token"
            ));
          },
          (entity) {
            emit(event.state);
          }
        );
      }
    }); 
  }
}
