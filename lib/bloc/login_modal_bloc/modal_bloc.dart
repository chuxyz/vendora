import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'modal_events.dart';
part 'modal_states.dart';

enum ModalStatus { None, Register, Authenticate }
enum LoginStatus { initial, loading, error, success, logout }

class ModalBloc extends Bloc<ModalEvent, ModalState> {
  ModalBloc()
      : super(
          const ModalState(
            googleButtonText: 'Sign In With Google',
            loginButtonText: 'Sign In With Email or Phone',
            preModalActionText: 'Don\'t have an account?',
            modalActionText: 'Sign Up',
            submitAction: ModalStatus.None,
            loginStatus: LoginStatus.initial,
            formVisibility: false,
            email: null,
            password: null,
            firebaseUser: null,
          ),
        );

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // @override
  // void onTransition(Transition<ModalEvent, ModalState> transition) {
  //   print(transition);
  //   super.onTransition(transition);
  // }

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
    } else if (event is EmailChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is PasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is AuthenticationEvent) {
      yield state.copyWith(loginStatus: LoginStatus.loading);

      try {
        final user = await _auth.signInWithEmailAndPassword(
            email: state.email!, password: state.password!);
        if (user != null) {
          yield state.copyWith(loginStatus: LoginStatus.success);
        }
      } catch (e) {
        print(e);
        yield state.copyWith(loginStatus: LoginStatus.error);
      }
      print(state);
    } else if (event is SetInitialLoginStatus) {
      yield state.copyWith(loginStatus: LoginStatus.initial);
    } else if (event is LoggedOut) {
      await _auth.signOut();
      yield state.copyWith(
        loginStatus: LoginStatus.logout,
      );
      print(state);
    }
  }
}
