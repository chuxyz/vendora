import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vendora/utilities/auth_utils.dart';

part 'register_vendor_event.dart';
part 'register_vendor_state.dart';

class RegisterVendorBloc extends Bloc<RegisterVendorEvent, RegisterVendorState>
    with AuthUtils {
  RegisterVendorBloc() : super(RegisterVendorInitial());

  final _fireStore = FirebaseFirestore.instance;

  Map<String, String?> errorMessage = {}; // initialized error message
  Map<String, String> errorMsg = {
    'brandName': 'Brand Name must be greater than two characters',
    'description': 'Description must be...',
    'tags': 'Tags must be seperated with commas and greater than tow chars',
    'category': 'Select a category',
    'stateName': 'Select a State',
    'lgaName': 'Select a Local Government',
    'email': 'It seems you didn\'t type a valid email address',
    'phone': 'You must have typed an invalid phone number. Try again',
  };

  @override
  Stream<RegisterVendorState> mapEventToState(
    RegisterVendorEvent event,
  ) async* {
    Map<String, String?> errorTextMap({
      String? brandName,
      String? description,
      String? tags,
      String? category,
      String? stateName,
      String? lgaName,
      String? email,
      String? phone,
    }) {
      return {
        // If error message had been set to '', set it to null (to clear error text)
        // else if it is set to a value (an error message) that is not null,
        // use the value that it is set to. Else(it is set to null) use the previous state's value
        // N.B: '' is used to set errorText to null to differentiate from the inital state null to a null
        // value after the user started typing
        'brandName': brandName == ''
            ? null
            : brandName != null
                ? brandName
                : state.errorText['brandName'],
        'description': description == ''
            ? null
            : description != null
                ? description
                : state.errorText['description'],
        'tags': tags == ''
            ? null
            : tags != null
                ? tags
                : state.errorText['tags'],
        'email': email == ''
            ? null
            : email != null
                ? email
                : state.errorText['email'],
        'phone': phone == ''
            ? null
            : phone != null
                ? phone
                : state.errorText['phone'],
      };
    }

    if (event is BrandNameUnfocused) {
      if (!isName(state.brandName)) {
        this.errorMessage = errorTextMap(brandName: errorMsg['brandName']);
      } else {
        this.errorMessage = errorTextMap(brandName: null);
      }
      yield state.copyWith(
        errorText: this.errorMessage,
        formStatus: validationStatus(errorMap: this.errorMessage),
      );
    }
    //
    else if (event is DescriptionUnfocused) {
      if (!isDescription(state.description)) {
        this.errorMessage = errorTextMap(description: errorMsg['description']);
      } else {
        this.errorMessage = errorTextMap(description: null);
      }
      yield state.copyWith(
        errorText: this.errorMessage,
        formStatus: validationStatus(errorMap: this.errorMessage),
      );
    }
    //
    else if (event is TagUnfocused) {
      if (!isTag(state.tags)) {
        this.errorMessage = errorTextMap(tags: errorMsg['tags']);
      } else {
        this.errorMessage = errorTextMap(tags: null);
      }
      yield state.copyWith(
        errorText: this.errorMessage,
        formStatus: validationStatus(errorMap: this.errorMessage),
      );
    }
    //
    else if (event is BrandEmailUnfocused) {
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
    else if (event is BrandPhoneUnfocused) {
      if (!isPhone(state.phone)) {
        this.errorMessage = errorTextMap(phone: errorMsg['phone']);
      } else {
        this.errorMessage = errorTextMap(phone: null);
      }
      yield state.copyWith(
        errorText: this.errorMessage,
        formStatus: validationStatus(errorMap: this.errorMessage),
      );
    } else if (event is BrandNameChanged) {
      print('object');
      if (isName(event.brandName)) {
        this.errorMessage = errorTextMap(brandName: '');
      } else {
        if (event.brandName != null)
          this.errorMessage = errorTextMap(brandName: errorMsg['brandName']);
      }
      yield state.copyWith(
        brandName: event.brandName,
        errorText: this.errorMessage,
        formStatus: validationStatus(
          fields: [
            state.brandName,
            state.description,
            state.tags,
            state.stateName,
            state.email,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
    }
    //
    else if (event is DescriptionChanged) {
      if (isDescription(event.description)) {
        this.errorMessage = errorTextMap(description: '');
      } else {
        if (event.description != null)
          this.errorMessage =
              errorTextMap(description: errorMsg['description']);
      }
      yield state.copyWith(
        description: event.description,
        errorText: this.errorMessage,
        formStatus: validationStatus(
          fields: [
            state.brandName,
            state.description,
            state.tags,
            state.stateName,
            state.email,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
    }
    //
    else if (event is TagChanged) {
      if (isTag(event.tags)) {
        this.errorMessage = errorTextMap(tags: '');
      } else {
        if (event.tags != null)
          this.errorMessage = errorTextMap(tags: errorMsg['tags']);
      }
      yield state.copyWith(
        tags: event.tags,
        errorText: this.errorMessage,
        formStatus: validationStatus(
          fields: [
            state.brandName,
            state.description,
            state.tags,
            state.stateName,
            state.email,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
    }
    //
    else if (event is BrandEmailChanged) {
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
            state.brandName,
            state.description,
            state.tags,
            state.stateName,
            state.email,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
    }
    //
    else if (event is BrandPhoneChanged) {
      if (isPhone(event.phone)) {
        this.errorMessage = errorTextMap(phone: '');
      } else {
        if (event.phone != null)
          this.errorMessage = errorTextMap(phone: errorMsg['phone']);
      }
      yield state.copyWith(
        phone: event.phone,
        errorText: this.errorMessage,
        formStatus: validationStatus(
          fields: [
            state.brandName,
            state.description,
            state.tags,
            state.stateName,
            state.email,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
    }
    //
    else if (event is StateNameChanged) {
      List<String> allLga = [];
      if (event.stateName != null) {
        QuerySnapshot getDocbyStateName = await _fireStore
            .collection('states')
            .where('stateName', isEqualTo: event.stateName)
            .get();
        String stateDoc = getDocbyStateName.docs.single.id;
        await _fireStore
            .collection('states')
            .doc(stateDoc)
            .collection('lga')
            .orderBy('lgaName', descending: false)
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            allLga.add(doc['lgaName']);
          });
        });
      }
      print(state.stateName);
      yield state.copyWith(
        stateName: event.stateName,
        errorText: this.errorMessage,
        allLga: allLga,
        formStatus: validationStatus(
          fields: [
            state.brandName,
            state.description,
            state.tags,
            event.stateName,
            state.email,
            state.phone
          ],
          errorMap: this.errorMessage,
        ),
      );
      //
    }
  }
}
