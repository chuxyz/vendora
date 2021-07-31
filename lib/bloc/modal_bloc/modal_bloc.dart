import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vendora/utilities/auth_utils.dart';
part 'modal_events.dart';
part 'modal_states.dart';

enum ModalStatus { None, Register, Authenticate }
enum LoginStatus { initial, loading, error, success, logout }

class ModalBloc extends Bloc<ModalEvents, ModalState> with AuthUtils {
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
            snackBarError: null,
            snackBarSuccess: null,
          ),
        );

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // @override
  // void onTransition(Transition<ModalEvent, ModalState> transition) {
  //   print(transition);
  //   super.onTransition(transition);
  // }

  @override
  Stream<ModalState> mapEventToState(ModalEvents event) async* {
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
    }
    //
    else if (event is EmailChanged) {
      yield state.copyWith(email: event.email);
    }
    //
    else if (event is PasswordChanged) {
      yield state.copyWith(password: event.password);
    }
    //
    else if (event is AuthenticationEvent) {
      yield state.copyWith(loginStatus: LoginStatus.loading);
      try {
        final userCredential = await _auth.signInWithEmailAndPassword(
            email: state.email!, password: state.password!);
        if (userCredential != null) {
          yield state.copyWith(
              loginStatus: LoginStatus.success,
              snackBarSuccess: 'Login Successful...');
        }
      } catch (e) {
        yield state.copyWith(
            loginStatus: LoginStatus.error,
            snackBarError: 'Sorry, An Error Occurred...');
      }
      print(state);
    }
    //
    else if (event is GoogleSignInEvent) {
      print(state);
      yield state.copyWith(loginStatus: LoginStatus.loading);
      // Trigger the authentication flow
      try {
        final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
        // Obtain the auth details from the request
        final GoogleSignInAuthentication _googleAuth =
            await _googleUser!.authentication;
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: _googleAuth.accessToken,
          idToken: _googleAuth.idToken,
        );
        // Once signed in, return the UserCredential
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        // If user is logged in...
        if (userCredential != null) {
          // ...and user is a new user?
          bool userExist = await userExists(userCredential);
          if (!userExist) {
            //Register User
            User user = userCredential.user!;
            List<String> displayName = splitDisplayName(user.displayName!);
            await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .set({
              'userId': user.uid,
              'firstName': displayName[0],
              'lastName': displayName[1],
              'email': user.email,
              'emailVerified': user.emailVerified,
              'phone': user.phoneNumber,
              'photoUrl': user.photoURL,
              'location': {},
              'is_admin': false,
              'is_vendor': false,
              'time': FieldValue.serverTimestamp(),
            });
            // End Register User
            yield state.copyWith(
                loginStatus: LoginStatus.success,
                snackBarSuccess:
                    'Registration Successful. You are now logged-in...');
          } else {
            // user is old
            yield state.copyWith(
                loginStatus: LoginStatus.success,
                snackBarSuccess: 'You are now logged-in...');
          }
        }
      } catch (e) {
        _googleSignIn.signOut();
        yield state.copyWith(
            loginStatus: LoginStatus.error,
            snackBarError: 'An Error Occurred!');
      }

      // final GoogleSignIn _googleSignIn = GoogleSignIn();
      // try {
      //   GoogleSignInAccount? currentUser = await _googleSignIn.signIn();
      //   if (currentUser != null) {
      //     yield state.copyWith(loginStatus: LoginStatus.success);
      //   } else {
      //     yield state.copyWith(loginStatus: LoginStatus.error);
      //   }
      // } catch (error) {
      //   print(error);
      //   yield state.copyWith(loginStatus: LoginStatus.error);
      // }
    }
    //
    else if (event is SetInitialLoginStatus) {
      yield state.copyWith(loginStatus: LoginStatus.initial);
    }
    //
    else if (event is LoggedOut) {
      await _auth.signOut();
      await _googleSignIn.signOut();
      // Set email and password states to null so user does not login with
      // empty fields even after logging out. Lol
      yield state.copyWith(
        email: null,
        password: null,
        loginStatus: LoginStatus.logout,
      );
    }
  }
}
