import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendora/bloc/register_bloc/register_bloc.dart';

part 'auth_events.dart';
part 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final RegisterBloc registerBloc;
  StreamSubscription? registerBlocSubscription;
  String? _email;
  String? _password;
  AuthBloc(this.registerBloc) : super(AuthInitialState()) {
    registerBlocSubscription = registerBloc.stream.listen((state) {
      this._email = state.email!;
      this._password = state.password!;
    });
  } //: super(AuthInitialState());

  @override
  Future<void> close() {
    registerBlocSubscription!.cancel();
    return super.close();
  }

  @override
  Stream<AuthStates> mapEventToState(AuthEvents event) async* {
    if (event is RegisterSubmit) {
      print('he $_email');
      yield AuthLoadingState();
      //Check duplicate phone and yield error
      final FirebaseAuth _auth = FirebaseAuth.instance;
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
                email: this._email!, password: this._password!);
        if (userCredential != null) {
          yield AuthSuccessState();
        } //else {
        //   yield state.copyWith(registerStatus: RegisterStatus.error);
        // }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          yield AuthErrorState();
        }
      } catch (e) {
        yield AuthErrorState();
        print(e);
      }
      // await Future.delayed(Duration(seconds: 3));
      // yield state.copyWith(registerStatus: RegisterStatus.success);
    }
  }
}
