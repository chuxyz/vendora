part of 'register_bloc.dart';

class RegisterStates extends Equatable {
  RegisterStates({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.confirmPassword,
    required this.phone,
    this.formStatus = FormStatus.invalid,
    this.errorText = const {
      'firstName': null,
      'lastName': null,
      'email': null,
      'password': null,
      'confirmPassword': null,
      'phone': null,
    },
  });

  final String? firstName;
  final String? lastName;
  final String? password;
  final String? email;
  final String? confirmPassword;
  final String? phone;
  final FormStatus formStatus;
  //final Map<String, bool> formValidated;
  final Map<String, String?> errorText;
  // final Map<String, bool> formValidated = {
  //   'firstName': false,
  //   'lastName': false,
  //   'email': false,
  //   'password': false,
  //   'confirmPassword': false,
  //   'phone': false,
  // };
  // Map<String, String?> errorText = {
  //   'firstName': null,
  //   'lastName': null,
  //   'email': null,
  //   'password': null,
  //   'confirmPassword': null,
  //   'phone': null,
  // };

  // bool canSubmit() {
  //   //return !formValidated.containsValue(false);
  // }

  RegisterStates copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    String? phone,
    FormStatus? formStatus,
    Map<String, String?>? errorText,
  }) {
    return RegisterStates(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phone: phone ?? this.phone,
      formStatus: formStatus ?? this.formStatus,
      errorText: errorText ?? this.errorText,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
        phone,
        formStatus,
        errorText,
      ];
}
