import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vendora/utilities/constants.dart';

part 'register_events.dart';
part 'register_states.dart';

enum FormStatus { valid, invalid }
enum RegisterStatus { initial, loading, error, success }

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc()
      : super(
          RegisterStates(
            firstName: null,
            lastName: null,
            password: null,
            email: null,
            confirmPassword: null,
            phone: null,
            errorText: {},
            registerStatus: RegisterStatus.initial,
          ),
        );

  Map<String, String?> errorMessage = {}; // initialized error message

  bool isName(String? name) {
    RegExp nameRegex = RegExp(r'^[a-zA-Z]{2,}');
    return nameRegex.hasMatch(name ?? '') ? true : false;
  }

  bool isEmail(String? email) {
    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    return emailRegex.hasMatch(email ?? '') ? true : false;
  }

  bool isPassword(String? password) {
    RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return passwordRegex.hasMatch(password ?? '') ? true : false;
  }

  bool passwordMatched(String? password1, String? password2) {
    return (password1 == password2) ? true : false;
  }

  bool isPhone(String? phone) {
    RegExp phoneRegex = RegExp(r'(^(?:[+0])?[0-9]{11,13}$)');
    return phoneRegex.hasMatch(phone ?? '') ? true : false;
  }

  FormStatus validationStatus(
      {List<String?>? fields, required Map<String, String?> errorMap}) {
    //List<String?> formValuesMap = [fname, lname, email, pwd, cpwd, phone];
    List<String?> errorMapToList =
        errorMap.values.toList(); // Set error map to list of values
    // check if every value == null (i.e all field validated(No error text)
    return (errorMapToList.every((e) => (e == null)) &&
            fields!.every((e) => (e != null)))
        ? FormStatus.valid
        : FormStatus.invalid;
  }

  @override
  Stream<RegisterStates> mapEventToState(RegisterEvents event) async* {
    // Function to create new Map on each event
    Map<String, String?> errorTextMap({
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? confirmPassword,
      String? phone,
    }) {
      return {
        'firstName': firstName == ''
            ? null
            : firstName != null
                ? firstName
                : state.errorText['firstName'],
        'lastName': lastName == ''
            ? null
            : lastName != null
                ? lastName
                : state.errorText['lastName'],
        'email': email == ''
            ? null
            : email != null
                ? email
                : state.errorText['email'],
        'password': password == ''
            ? null
            : password != null
                ? password
                : state.errorText['password'],
        'confirmPassword': confirmPassword == ''
            ? null
            : confirmPassword != null
                ? confirmPassword
                : state.errorText['confirmPassword'],
        'phone': phone == ''
            ? null
            : phone != null
                ? phone
                : state.errorText['phone'],
      };
    }

    if (event is FirstNameUnfocused) {
      if (!isName(state.firstName)) {
        this.errorMessage = errorTextMap(firstName: errorMsg['firstName']);
      } else {
        this.errorMessage = errorTextMap(firstName: null);
      }
      yield state.copyWith(
        errorText: this.errorMessage,
        formStatus: validationStatus(errorMap: this.errorMessage),
      );
    }
    //
    else if (event is LastNameUnfocused) {
      if (!isName(state.lastName)) {
        this.errorMessage = errorTextMap(lastName: errorMsg['lastName']);
      } else {
        this.errorMessage = errorTextMap(lastName: null);
      }
      yield state.copyWith(
        errorText: this.errorMessage,
        formStatus: validationStatus(
          errorMap: this.errorMessage,
        ),
      );
    }
    //
    else if (event is EmailUnfocused) {
      if (!isEmail(state.email)) {
        this.errorMessage = errorTextMap(email: errorMsg['email']);
      } else {
        this.errorMessage = errorTextMap(email: null);
      }
      yield state.copyWith(
        errorText: this.errorMessage,
        formStatus: validationStatus(errorMap: this.errorMessage),
      );
    }
    //
    else if (event is PasswordUnfocused) {
      if (!isPassword(state.password)) {
        this.errorMessage = errorTextMap(password: errorMsg['password']);
      } else {
        this.errorMessage = errorTextMap(password: null);
      }
      yield state.copyWith(
        errorText: this.errorMessage,
        formStatus: validationStatus(errorMap: this.errorMessage),
      );
    }
    //
    else if (event is ConfirmPasswordUnfocused) {
      if (!passwordMatched(state.password, state.confirmPassword)) {
        this.errorMessage =
            errorTextMap(confirmPassword: errorMsg['confirmPassword']);
      } else {
        this.errorMessage = errorTextMap(confirmPassword: null);
      }
      yield state.copyWith(
        errorText: this.errorMessage,
        formStatus: validationStatus(errorMap: this.errorMessage),
      );
    }
    //
    else if (event is PhoneUnfocused) {
      if (!isPhone(state.phone)) {
        this.errorMessage = errorTextMap(phone: errorMsg['phone']);
      } else {
        this.errorMessage = errorTextMap(phone: null);
      }
      yield state.copyWith(
        errorText: this.errorMessage,
        formStatus: validationStatus(errorMap: this.errorMessage),
      );
    }
    //
    else if (event is FirstNameChanged) {
      // If text field input changed...
      if (isName(event.firstName)) {
        // ...and input is valid..
        this.errorMessage = errorTextMap(
            firstName: ''); // set error field to '', to be set to null later
      } else {
        if (event.firstName != null)
          this.errorMessage = errorTextMap(firstName: errorMsg['firstName']);
      }

      yield state.copyWith(
        firstName: event.firstName,
        errorText: this.errorMessage,
        formStatus: validationStatus(
          fields: [
            state.firstName,
            state.lastName,
            state.email,
            state.password,
            state.confirmPassword,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
      print(state);
    }
    //
    else if (event is LastNameChanged) {
      if (isName(event.lastName)) {
        this.errorMessage = errorTextMap(lastName: '');
      } else {
        if (event.lastName != null)
          this.errorMessage = errorTextMap(lastName: errorMsg['lastName']);
      }
      yield state.copyWith(
        lastName: event.lastName,
        errorText: this.errorMessage,
        formStatus: validationStatus(
          fields: [
            state.firstName,
            state.lastName,
            state.email,
            state.password,
            state.confirmPassword,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
    }
    //
    else if (event is EmailChanged) {
      if (isEmail(event.email)) {
        this.errorMessage = errorTextMap(email: '');
      } else {
        if (event.email != null)
          this.errorMessage = errorTextMap(email: errorMsg['email']);
      }
      yield state.copyWith(
        email: event.email,
        errorText: this.errorMessage,
        formStatus: validationStatus(
          fields: [
            state.firstName,
            state.lastName,
            state.email,
            state.password,
            state.confirmPassword,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
    }
    //
    else if (event is PasswordChanged) {
      if (isPassword(event.password)) {
        this.errorMessage = errorTextMap(password: '');
      } else {
        if (event.password != null)
          this.errorMessage = errorTextMap(password: errorMsg['password']);
      }
      yield state.copyWith(
        password: event.password,
        errorText: this.errorMessage,
        formStatus: validationStatus(
          fields: [
            state.firstName,
            state.lastName,
            state.email,
            state.password,
            state.confirmPassword,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
    }
    //
    else if (event is ConfirmPasswordChanged) {
      if (passwordMatched(state.password, event.confirmPassword)) {
        this.errorMessage = errorTextMap(confirmPassword: '');
      } else {
        if (event.confirmPassword != null)
          this.errorMessage =
              errorTextMap(confirmPassword: errorMsg['confirmPassword']);
      }
      yield state.copyWith(
        confirmPassword: event.confirmPassword,
        errorText: this.errorMessage,
        formStatus: validationStatus(
          fields: [
            state.firstName,
            state.lastName,
            state.email,
            state.password,
            state.confirmPassword,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
    }
    //
    else if (event is PhoneChanged) {
      if (isPhone(event.phone)) {
        //state.formValidated['firstName'] = false;
        this.errorMessage = errorTextMap(phone: '');
      } else {
        if (event.phone != null)
          this.errorMessage = errorTextMap(phone: errorMsg['phone']);
      }
      print(this.errorMessage);
      yield state.copyWith(
        phone: event.phone,
        errorText: this.errorMessage,
        formStatus: validationStatus(
          fields: [
            state.firstName,
            state.lastName,
            state.email,
            state.password,
            state.confirmPassword,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
    }
    //
    else if (event is RegisterSubmit) {
      yield state.copyWith(registerStatus: RegisterStatus.loading);
      //Check duplicate phone and yield error
      final FirebaseAuth _auth = FirebaseAuth.instance;
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
                email: state.email!, password: state.password!);
        if (userCredential != null) {
          User user = userCredential.user!;
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'firstName': state.firstName,
            'lastName': state.lastName,
            'email': state.email,
            'phone': state.phone,
            'location': {},
            'is_admin': false,
            'is_vendor': false,
            'time': FieldValue.serverTimestamp(),
          });
          yield state.copyWith(registerStatus: RegisterStatus.success);
        } //else {
        //   yield state.copyWith(registerStatus: RegisterStatus.error);
        // }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          this.errorMessage =
              errorTextMap(email: 'This email address is already in use');
          yield state.copyWith(registerStatus: RegisterStatus.error);
        }
      } catch (e) {
        yield state.copyWith(registerStatus: RegisterStatus.error);
        print(e);
      }
      //   // await Future.delayed(Duration(seconds: 3));
      //   // yield state.copyWith(registerStatus: RegisterStatus.success);
    }
  }
}
