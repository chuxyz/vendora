part of 'auth_bloc.dart';

abstract class AuthStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthErrorState extends AuthStates {}

class AuthSuccessState extends AuthStates {}
