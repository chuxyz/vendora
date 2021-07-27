part of 'auth_bloc.dart';

abstract class AuthEvents extends Equatable {
  const AuthEvents();

  @override
  List<Object> get props => [];
}

class RegisterSubmit extends AuthEvents {}

class LoginSubmit extends AuthEvents {}
