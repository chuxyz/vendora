part of 'modal_bloc.dart';

abstract class ModalEvent extends Equatable {
  const ModalEvent();

  @override
  List<Object> get props => [];
}

class ShowSignUpEvent extends ModalEvent {}

class ShowLoginEvent extends ModalEvent {}

class SignUpButtonEvent extends ModalEvent {}

class LoginButtonEvent extends ModalEvent {}

class EmailChanged extends ModalEvent {
  EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends ModalEvent {
  PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class AuthenticationEvent extends ModalEvent {}

class SetInitialLoginStatus extends ModalEvent {}

class OpenFavorite extends ModalEvent {}

class OpenProfile extends ModalEvent {}

class LoggedOut extends ModalEvent {}
