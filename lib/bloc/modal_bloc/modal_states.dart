part of 'modal_bloc.dart';

class ModalState extends Equatable {
  const ModalState({
    required this.googleButtonText,
    required this.loginButtonText,
    required this.preModalActionText,
    required this.modalActionText,
    required this.submitAction,
    required this.loginStatus,
    required this.formVisibility,
    required this.email,
    required this.password,
    required this.firebaseUser,
    required this.snackBarError,
    required this.snackBarSuccess,
  });

  final String googleButtonText;
  final String loginButtonText;
  final String preModalActionText;
  final String modalActionText;
  final ModalStatus submitAction;
  final LoginStatus loginStatus;
  final bool formVisibility;
  final String? email;
  final String? password;
  final User? firebaseUser;
  final String? snackBarError;
  final String? snackBarSuccess;
  //static String registerRoute = RegisterScreen.routeID;

  ModalState copyWith({
    String? googleButtonText,
    String? loginButtonText,
    String? preModalActionText,
    String? modalActionText,
    ModalStatus? submitAction,
    LoginStatus? loginStatus,
    bool? formVisibility,
    String? email,
    String? password,
    User? firebaseUser,
    String? snackBarError,
    String? snackBarSuccess,
  }) {
    return ModalState(
      googleButtonText: googleButtonText ?? this.googleButtonText,
      loginButtonText: loginButtonText ?? this.loginButtonText,
      preModalActionText: preModalActionText ?? this.preModalActionText,
      modalActionText: modalActionText ?? this.modalActionText,
      submitAction: submitAction ?? this.submitAction,
      loginStatus: loginStatus ?? this.loginStatus,
      formVisibility: formVisibility ?? this.formVisibility,
      email: email ?? this.email,
      password: password ?? this.password,
      firebaseUser: firebaseUser ?? this.firebaseUser,
      snackBarError: snackBarError ?? this.snackBarError,
      snackBarSuccess: snackBarSuccess ?? this.snackBarSuccess,
    );
  }

  @override
  List<Object?> get props => [
        googleButtonText,
        loginButtonText,
        preModalActionText,
        modalActionText,
        submitAction,
        loginStatus,
        formVisibility,
        email,
        password,
        firebaseUser,
        snackBarError,
        snackBarSuccess,
      ];
}
