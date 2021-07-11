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

class AuthenticationEvent extends ModalEvent {}
