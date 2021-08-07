import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendora/bloc/register_vendor_bloc/register_vendor_bloc.dart';
import 'package:vendora/components/custom_button.dart';
import 'package:vendora/components/custom_drop_down_button.dart';
import 'package:vendora/components/custom_text_field.dart';
import 'package:vendora/utilities/constants.dart';
import 'package:vendora/utilities/auth_utils.dart';

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
  final AuthUtils au = AuthUtils();

  final _brandNameFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _tagFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();

  @override
  void initState() {
    _brandNameFocusNode.addListener(() {
      if (!_brandNameFocusNode.hasFocus) {
        BlocProvider.of<RegisterVendorBloc>(context).add(BrandNameUnfocused());
      }
    });

    _descriptionFocusNode.addListener(() {
      if (!_descriptionFocusNode.hasFocus)
        BlocProvider.of<RegisterVendorBloc>(context)
            .add(DescriptionUnfocused());
    });

    _tagFocusNode.addListener(() {
      if (!_tagFocusNode.hasFocus) {
        BlocProvider.of<RegisterVendorBloc>(context).add(TagUnfocused());
      }
    });

    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        BlocProvider.of<RegisterVendorBloc>(context).add(BrandEmailUnfocused());
      }
    });

    _phoneFocusNode.addListener(() {
      if (!_phoneFocusNode.hasFocus) {
        BlocProvider.of<RegisterVendorBloc>(context).add(BrandPhoneUnfocused());
      }
    });
    //BlocProvider.of<RegisterVendorBloc>(context).add(LoadCategoryData());
    super.initState();
  }

  @override
  void dispose() {
    _brandNameFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _tagFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

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
                            onChanged: (value) {
                              BlocProvider.of<RegisterVendorBloc>(context)
                                  .add(BrandNameChanged(brandName: value));
                            },
                            focusNode: _brandNameFocusNode,
                            hintText: 'Brand Name*',
                            labelText: 'Brand Name*',
                            textInputAction: TextInputAction.next,
                            errorText: state.errorText['brandName'],
                          ),
                          kTextFieldSpacing,
                          RawMaterialButton(
                            fillColor: Colors.purpleAccent.withOpacity(0.5),
                            child: Icon(
                              Icons.add_photo_alternate_rounded,
                              color: Colors.white,
                            ),
                            elevation: 8,
                            onPressed: () async {},
                            padding: EdgeInsets.all(15),
                            shape: CircleBorder(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('Add Logo'),
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {
                              BlocProvider.of<RegisterVendorBloc>(context)
                                  .add(DescriptionChanged(description: value));
                            },
                            keyboardType: TextInputType.multiline,
                            maxLine: 3,
                            focusNode: _descriptionFocusNode,
                            hintText: 'Brief description about business',
                            labelText: 'Description*',
                            textInputAction: TextInputAction.next,
                            errorText: state.errorText['description'],
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {
                              BlocProvider.of<RegisterVendorBloc>(context)
                                  .add(TagChanged(tags: value));
                            },
                            keyboardType: TextInputType.multiline,
                            focusNode: _tagFocusNode,
                            hintText: 'E.g. Food, Wines, ...',
                            labelText: 'Tags*',
                            textInputAction: TextInputAction.next,
                            errorText: state.errorText['tags'],
                          ),
                          kTextFieldSpacing,
                          CustomDropDownButton(
                            items: [],
                            hintText: 'Business Category*',
                            onChanged: (value) {
                              BlocProvider.of<RegisterVendorBloc>(context)
                                  .add(CategoryChanged(category: value));
                            },
                          ),
                          kTextFieldSpacing,
                          CustomDropDownButton(
                            items: ngStates,
                            hintText: 'State*',
                            onChanged: (value) {
                              BlocProvider.of<RegisterVendorBloc>(context)
                                  .add(StateNameChanged(stateName: value));
                            },
                          ),
                          kTextFieldSpacing,
                          CustomDropDownButton(
                            items: state.allLga,
                            hintText: 'LGA*',
                            onChanged: (value) {
                              BlocProvider.of<RegisterVendorBloc>(context)
                                  .add(LgaNameChanged(lgaName: value));
                            },
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {
                              BlocProvider.of<RegisterVendorBloc>(context)
                                  .add(BrandEmailChanged(email: value));
                            },
                            focusNode: _emailFocusNode,
                            hintText: 'Business Email',
                            labelText: 'Business Email',
                            textInputAction: TextInputAction.next,
                            errorText: state.errorText['email'],
                          ),
                          kTextFieldSpacing,
                          CustomTextField(
                            onChanged: (value) {
                              BlocProvider.of<RegisterVendorBloc>(context)
                                  .add(BrandPhoneChanged(phone: value));
                            },
                            focusNode: _phoneFocusNode,
                            hintText: 'Business Phone',
                            labelText: 'Business Phone',
                            textInputAction: TextInputAction.done,
                            errorText: state.errorText['phone'],
                          ),
                          kTextFieldSpacing,
                          SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              buttonLabel: 'Register Vendor',
                              onPressed:
                                  (state.formStatus == FormStatus.invalid)
                                      ? null
                                      : () {},
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
