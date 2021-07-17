import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'modal_events.dart';
part 'modal_states.dart';

enum ModalStatus { None, Register, Authenticate }

class ModalBloc extends Bloc<ModalEvent, ModalState> {
  ModalBloc()
      : super(
          const ModalState(
            googleButtonText: 'Sign In With Google',
            loginButtonText: 'Sign In With Email or Phone',
            preModalActionText: 'Don\'t have an account?',
            modalActionText: 'Sign Up',
            submitAction: ModalStatus.None,
            formVisibility: false,
          ),
        );

  @override
  void onTransition(Transition<ModalEvent, ModalState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<ModalState> mapEventToState(ModalEvent event) async* {
    if (event is ShowSignUpEvent) {
      yield state.copyWith(
        googleButtonText: 'Sign Up With Google',
        loginButtonText: 'Sign Up with email or password',
        preModalActionText: 'Already Registered?',
        modalActionText: 'Sign In',
        submitAction: ModalStatus.Register,
        formVisibility: false,
      );
      print(state.preModalActionText);
    } else if (event is ShowLoginEvent) {
      yield state.copyWith(
        googleButtonText: 'Sign In With Google',
        loginButtonText: 'Sign In with email or password',
        preModalActionText: 'Don\'t have an account?',
        modalActionText: 'Sign Up',
        submitAction: ModalStatus.None,
      );
    } else if (event is LoginButtonEvent) {
      yield state.copyWith(
        loginButtonText: 'Sign In',
        submitAction: ModalStatus.Authenticate,
        formVisibility: true,
      );
    } else if (event is SignUpButtonEvent) {
      //yield state.copyWith();
    } else if (event is AuthenticationEvent) {}
  }
}
