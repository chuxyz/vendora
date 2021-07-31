part of 'modal_bloc.dart';

abstract class ModalEvents extends Equatable {
  const ModalEvents();

  @override
  List<Object> get props => [];
}

class ShowSignUpEvent extends ModalEvents {}

class ShowLoginEvent extends ModalEvents {}

class SignUpButtonEvent extends ModalEvents {}

class LoginButtonEvent extends ModalEvents {}

class EmailChanged extends ModalEvents {
  EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends ModalEvents {
  PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class AuthenticationEvent extends ModalEvents {}

class GoogleSignInEvent extends ModalEvents {}

class GoogleSignUpEvent extends ModalEvents {}

class SetInitialLoginStatus extends ModalEvents {}

class OpenFavorite extends ModalEvents {}

class OpenProfile extends ModalEvents {}

class LoggedOut extends ModalEvents {}
