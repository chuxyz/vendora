part of 'register_bloc.dart';

abstract class RegisterEvents extends Equatable {
  const RegisterEvents();

  @override
  List<Object> get props => [];
}

class FirstNameUnfocused extends RegisterEvents {}

class FirstNameChanged extends RegisterEvents {
  const FirstNameChanged({required this.firstName});

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class LastNameUnfocused extends RegisterEvents {}

class LastNameChanged extends RegisterEvents {
  const LastNameChanged({required this.lastName});

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class EmailUnfocused extends RegisterEvents {}

class EmailChanged extends RegisterEvents {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordUnfocused extends RegisterEvents {}

class PasswordChanged extends RegisterEvents {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordUnfocused extends RegisterEvents {}

class ConfirmPasswordChanged extends RegisterEvents {
  const ConfirmPasswordChanged({required this.confirmPassword});

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class PhoneUnfocused extends RegisterEvents {}

class PhoneChanged extends RegisterEvents {
  const PhoneChanged({required this.phone});

  final String phone;

  @override
  List<Object> get props => [phone];
}

class RegisterSubmit extends RegisterEvents {}
