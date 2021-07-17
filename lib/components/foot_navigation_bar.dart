import 'package:flutter/material.dart';
import 'package:vendora/components/custom_button.dart';
import 'package:vendora/screens/register_screen.dart';
import 'package:vendora/utilities/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendora/bloc/login_modal_bloc/modal_bloc.dart';

class FootNavigationBar extends StatelessWidget {
  FootNavigationBar({
    Key? key,
    int? navBarIndex,
  })  : _navBarIndex = navBarIndex,
        super(key: key);

  final int? _navBarIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ModalBloc(),
      child: BlocBuilder<ModalBloc, ModalState>(
        builder: (context, state) => BottomNavigationBar(
          currentIndex: _navBarIndex!,
          selectedItemColor: kThemeColor,
          onTap: (int index) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0),
                ),
              ),
              builder: (_) {
                return BlocProvider.value(
                  // Set BlocProvider for bottom sheet
                  value: BlocProvider.of<ModalBloc>(
                      context), // Reference Bloc of parent context
                  child: BlocBuilder<ModalBloc, ModalState>(
                    builder: (_, state) => Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(_).viewInsets.bottom,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: Center(
                                  child: Text('${state.googleButtonText}'),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 2.0,
                                  onPrimary: Colors.black87,
                                  side: BorderSide(
                                    color: Colors.grey,
                                    width: 0.2,
                                    style: BorderStyle.solid,
                                  ),
                                  primary: Color(0xFFFFFFFF),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 15),
                                  textStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 7.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1.0,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Visibility(
                              visible: state.formVisibility,
                              child: Form(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Email/Phone*',
                                          labelText: 'Email/Phone*',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.blueAccent,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: 'Password*',
                                          labelText: 'Password*',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.blueAccent,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: CustomButton(
                                buttonLabel: state.loginButtonText,
                                onPressed: () {
                                  switch (state.submitAction) {
                                    case ModalStatus.Register:
                                      //BlocProvider.of<ModalBloc>(context)
                                      //.add(SignUpButtonEvent());
                                      Navigator.pushNamed(
                                          context, RegisterScreen.routeID);
                                      break;
                                    case ModalStatus.None:
                                      BlocProvider.of<ModalBloc>(context)
                                          .add(LoginButtonEvent());
                                      break;
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 6.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${state.preModalActionText}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0,
                                  ),
                                ),
                                TextButton(
                                  child: Text('${state.modalActionText}'),
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                    ),
                                    onSurface: kThemeColor,
                                    padding: EdgeInsets.all(0.0),
                                  ),
                                  onPressed: () {
                                    switch (state.submitAction) {
                                      case ModalStatus.None:
                                      case ModalStatus.Authenticate:
                                        BlocProvider.of<ModalBloc>(context)
                                            .add(ShowSignUpEvent());
                                        break;
                                      case ModalStatus.Register:
                                        BlocProvider.of<ModalBloc>(context)
                                            .add(ShowLoginEvent());
                                        break;
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 6.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('By Continuing, you agree to the '),
                                Text('Terms of use'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
            // setState(() {
            //   _navBarIndex = index;
            //   _showLoginPane = true;
            // });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
