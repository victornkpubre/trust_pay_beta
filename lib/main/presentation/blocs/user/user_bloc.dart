import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/repository/repositories.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AppPreferences _appPreferences;
  final UserRepository _repository;

  UserBloc(this._appPreferences, this._repository) : super(const _Initial()) {
    on<UserEvent>((event, emit) async {
      if (event is _LoadUser) {
        emit(const UserState(status: UserBlocStatus.loading));
        (await _repository.getUser(event.id)).fold(
          (failure) {
            toastFailure(failure);
            emit(const UserState(status: UserBlocStatus.error));
          }, 
          (entity) {
            _appPreferences.setUser(entity);
            emit(UserState(user: entity, status: UserBlocStatus.userLoaded));
          } 
        ); 
      }

      if (event is _CurrentUser) {
        emit(const UserState(status: UserBlocStatus.loading));
        User? user = await _appPreferences.getUser();
        emit(UserState(user: user, status: UserBlocStatus.userLoaded));
      }

      if (event is _SearchUser) {
        emit(const UserState(status: UserBlocStatus.loading));
        (await _repository.searchUser(event.searchText, event.pageSize, event.page)).fold(
            (failure) {
              toastFailure(failure);
              emit(const UserState(status: UserBlocStatus.error));
            },
            (entity) {
              emit(UserState(userSearchResults: entity, status: UserBlocStatus.usersLoaded));
            }
        );
      }

      // if (event is _GetStatistics && event.user.id != null) {
      //   emit(const UserState(status: UserBlocStatus.loading));
      //   (await _repository.getUserStatistics(event.user.id!)).fold(
      //       (failure) {
      //         toastFailure(failure);
      //         emit(const UserState(status: UserBlocStatus.error));
      //       },
      //       (entity) {
      //         User user = event.user.copyWith(statistics: entity);
      //         emit(UserState(user: user, status: UserBlocStatus.userLoaded));
      //       }
      //   );
      // }
    }); 
  }
}
