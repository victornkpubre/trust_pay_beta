part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(
    String email, 
    String password
  ) = _Login;
  const factory AuthEvent.register(
    String firstName, 
    String lastName,
    String email, 
    String password
  ) = _Register;
}