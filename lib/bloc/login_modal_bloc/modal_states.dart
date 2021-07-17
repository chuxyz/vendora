part of 'modal_bloc.dart';

class ModalState extends Equatable {
  const ModalState(
      {required this.googleButtonText,
      required this.loginButtonText,
      required this.preModalActionText,
      required this.modalActionText,
      required this.submitAction,
      required this.formVisibility});

  final String googleButtonText;
  final String loginButtonText;
  final String preModalActionText;
  final String modalActionText;
  final ModalStatus submitAction;
  final bool formVisibility;
  //static String registerRoute = RegisterScreen.routeID;

  ModalState copyWith({
    String? googleButtonText,
    String? loginButtonText,
    String? preModalActionText,
    String? modalActionText,
    ModalStatus? submitAction,
    bool? formVisibility,
  }) {
    return ModalState(
      googleButtonText: googleButtonText ?? this.googleButtonText,
      loginButtonText: loginButtonText ?? this.loginButtonText,
      preModalActionText: preModalActionText ?? this.preModalActionText,
      modalActionText: modalActionText ?? this.modalActionText,
      submitAction: submitAction ?? this.submitAction,
      formVisibility: formVisibility ?? this.formVisibility,
    );
  }

  @override
  List<Object> get props => [
        googleButtonText,
        loginButtonText,
        preModalActionText,
        modalActionText,
        submitAction,
        formVisibility
      ];
}
