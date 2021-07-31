import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendora/bloc/register_vendor_bloc/register_vendor_bloc.dart';
import 'package:vendora/components/custom_button.dart';
import 'package:vendora/components/custom_drop_down_button.dart';
import 'package:vendora/components/custom_text_field.dart';
import 'package:vendora/utilities/constants.dart';

class RegisterVendorScreen extends StatelessWidget {
  const RegisterVendorScreen({Key? key}) : super(key: key);

  static String routeID = 'register_vendor_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterVendorBloc(),
      child: RegisterVendorScreenView(),
    );
  }
}

class RegisterVendorScreenView extends StatefulWidget {
  const RegisterVendorScreenView({Key? key}) : super(key: key);

  @override
  _RegisterVendorScreenViewState createState() =>
      _RegisterVendorScreenViewState();
}

class _RegisterVendorScreenViewState extends State<RegisterVendorScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Enlist Your Brand'),
      ),
      body: BlocListener<RegisterVendorBloc, RegisterVendorState>(
        listener: (context, state) {},
        child: BlocBuilder<RegisterVendorBloc, RegisterVendorState>(
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
                          'Register Your Brand',
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
                            onChanged: (value) {},
                            focusNode: null,
                            hintText: 'Brand Name*',
                            labelText: 'Brand Name*',
                            textInputAction: TextInputAction.next,
                            errorText: null,
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {},
                            keyboardType: TextInputType.multiline,
                            maxLine: 3,
                            focusNode: null,
                            hintText: 'Brief description about business',
                            labelText: 'Description*',
                            textInputAction: TextInputAction.next,
                            errorText: null,
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {},
                            keyboardType: TextInputType.multiline,
                            focusNode: null,
                            hintText: 'E.g. Food, Wines, ...',
                            labelText: 'Tags*',
                            textInputAction: TextInputAction.next,
                            errorText: null,
                          ),
                          kTextFieldSpacing,
                          CustomDropDownButton(
                            hintText: 'Business Category*',
                          ),
                          kTextFieldSpacing,
                          CustomDropDownButton(
                            hintText: 'State*',
                          ),
                          kTextFieldSpacing,
                          CustomDropDownButton(
                            hintText: 'LGA*',
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {},
                            focusNode: null,
                            hintText: 'Website',
                            labelText: 'Website',
                            textInputAction: TextInputAction.next,
                            errorText: null,
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {},
                            focusNode: null,
                            hintText: 'Business Email',
                            labelText: 'Business Email',
                            textInputAction: TextInputAction.next,
                            errorText: null,
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {},
                            focusNode: null,
                            hintText: 'Business Phone',
                            labelText: 'Business Phone',
                            textInputAction: TextInputAction.done,
                            errorText: null,
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {},
                            focusNode: null,
                            hintText: 'Facebook',
                            labelText: 'Facebook',
                            textInputAction: TextInputAction.done,
                            errorText: null,
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {},
                            focusNode: null,
                            hintText: 'Twitter',
                            labelText: 'Twitter',
                            textInputAction: TextInputAction.done,
                            errorText: null,
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {},
                            focusNode: null,
                            hintText: 'Instagram',
                            labelText: 'Instagram',
                            textInputAction: TextInputAction.done,
                            errorText: null,
                          ),
                          kTextFieldSpacing,
                          SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              buttonLabel: 'Register Vendor',
                              onPressed: () {},
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
