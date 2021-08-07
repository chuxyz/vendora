import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendora/bloc/register_bloc/register_bloc.dart';
import 'package:vendora/components/custom_button.dart';
import 'package:vendora/components/custom_progress_indicator.dart';
import 'package:vendora/components/custom_text_field.dart';
import 'package:vendora/screens/start_screen.dart';
import 'package:vendora/utilities/auth_utils.dart';
import 'package:vendora/utilities/constants.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static String routeID = 'register_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (_) => RegisterBloc(),
      child: RegisterView(),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _firstNameFocusNode.addListener(() {
      if (!_firstNameFocusNode.hasFocus) {
        BlocProvider.of<RegisterBloc>(context).add(FirstNameUnfocused());
        //FocusScope.of(context).requestFocus(_lastNameFocusNode);
      }
    });

    _lastNameFocusNode.addListener(() {
      if (!_lastNameFocusNode.hasFocus) {
        BlocProvider.of<RegisterBloc>(context).add(LastNameUnfocused());
        //FocusScope.of(context).requestFocus(_emailFocusNode);
      }
    });

    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        BlocProvider.of<RegisterBloc>(context).add(EmailUnfocused());
        //FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });

    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        BlocProvider.of<RegisterBloc>(context).add(PasswordUnfocused());
        //FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
      }
    });

    _confirmPasswordFocusNode.addListener(() {
      if (!_confirmPasswordFocusNode.hasFocus) {
        BlocProvider.of<RegisterBloc>(context).add(ConfirmPasswordUnfocused());
        //FocusScope.of(context).requestFocus(_phoneFocusNode);
      }
    });

    _phoneFocusNode.addListener(() {
      if (!_phoneFocusNode.hasFocus) {
        BlocProvider.of<RegisterBloc>(context).add(PhoneUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  late BuildContext dialogContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: BlocListener<RegisterBloc, RegisterStates>(
        listener: (context, state) {
          if (state.registerStatus == RegisterStatus.loading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return CustomProgressIndicator(indicatorLabel: 'Signing-Up...');
              },
            );
          } else if (state.registerStatus == RegisterStatus.success) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green.withOpacity(0.8),
                content: Text('Registration Successful!'),
              ),
            );
            Navigator.pushNamedAndRemoveUntil(
                context, StartScreen.routeID, (route) => false);
          } else if (state.registerStatus == RegisterStatus.error) {
            print('Error');
            //state.registerStatus == RegisterStatus.initial;
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('An Error Occurred!'),
              ),
            );
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterStates>(
          builder: (context, state) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: Text(
                          'Register New User',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    kTextFieldSpacing,
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CustomTextField(
                            onChanged: (value) {
                              BlocProvider.of<RegisterBloc>(context)
                                  .add(FirstNameChanged(firstName: value));
                            },
                            focusNode: _firstNameFocusNode,
                            hintText: 'First Name*',
                            labelText: 'First Name*',
                            textInputAction: TextInputAction.next,
                            errorText: state.errorText['firstName'],
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {
                              BlocProvider.of<RegisterBloc>(context)
                                  .add(LastNameChanged(lastName: value));
                            },
                            focusNode: _lastNameFocusNode,
                            hintText: 'Last Name*',
                            labelText: 'Last Name*',
                            textInputAction: TextInputAction.next,
                            errorText: state.errorText['lastName'],
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {
                              BlocProvider.of<RegisterBloc>(context)
                                  .add(EmailChanged(email: value));
                              print(state.errorText['firstName']);
                              print(state.errorText['lastName']);
                            },
                            focusNode: _emailFocusNode,
                            hintText: 'Email*',
                            labelText: 'Email*',
                            textInputAction: TextInputAction.next,
                            errorText: state.errorText['email'],
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {
                              BlocProvider.of<RegisterBloc>(context)
                                  .add(PasswordChanged(password: value));
                            },
                            focusNode: _passwordFocusNode,
                            hintText: 'Password*',
                            labelText: 'Password*',
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            errorText: state.errorText['password'],
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {
                              BlocProvider.of<RegisterBloc>(context).add(
                                  ConfirmPasswordChanged(
                                      confirmPassword: value));
                            },
                            focusNode: _confirmPasswordFocusNode,
                            hintText: 'Confirm Password*',
                            labelText: 'Confirm Password*',
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            errorText: state.errorText['confirmPassword'],
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {
                              BlocProvider.of<RegisterBloc>(context)
                                  .add(PhoneChanged(phone: value));
                            },
                            focusNode: _phoneFocusNode,
                            hintText: 'Phone*',
                            labelText: 'Phone*',
                            textInputAction: TextInputAction.done,
                            errorText: state.errorText['phone'],
                          ),
                          kTextFieldSpacing,
                          SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              buttonLabel: 'Register',
                              onPressed: state.formStatus == FormStatus.invalid
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      BlocProvider.of<RegisterBloc>(context)
                                          .add(RegisterSubmit());
                                      print(state.registerStatus);
                                    },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
