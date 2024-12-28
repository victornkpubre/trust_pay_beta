import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trust_pay_beta/main/domain/entities/user/entities.dart';
import 'package:trust_pay_beta/main/domain/repository/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc(this.repository) : super(const _Initial()) {
    on<AuthEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));

      try {
        (await repository.login(event.email, event.password)).fold(
          (failure) {
            emit(state.copyWith(
              status: AuthStatus.error,
              errorMessage: failure.message
            ));
          }, 
          (entity) {
            emit(state.copyWith(
              status: AuthStatus.authenticated,
              user: entity.user,
              token: entity.token??''
            ));
          }
        );
      } catch (e) {
        emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: e.toString()
        ));
      }
    });
  }
}
