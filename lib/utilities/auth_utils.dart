import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

enum FormStatus { valid, invalid }
enum RegisterStatus { initial, loading, error, success }

class AuthUtils {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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

  bool isLogin() {
    if (_firebaseAuth.currentUser != null || _googleSignIn.currentUser != null)
      return true;
    return false;
  }

  Future<bool> userExists(UserCredential userCredential) async {
    String? email = userCredential.user!.email;
    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return (snapshot.docs.length > 0) ? true : false;
  }

  List<String> splitDisplayName(String displayName) {
    return displayName.toString().split(' ');
  }

  bool isDescription(String? description) {
    return ((description ?? '').length > 10) ? true : false;
  }

  bool isTag(String? tags) {
    // Tags are comma separated String. Split them into a List
    List<String> tagList = (tags ?? '').split(',');
    // Create new list where each String item length is less than 3 chars
    List<String> newTagList =
        tagList.where((e) => e.trim().length < 3).toList();
        // Retur true if lenght of new list is 0. Else return false
    return (newTagList.length < 1) ? true : false;
  }

  bool isURL(String? url) {
    RegExp urlRegex = RegExp(
        r'^[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
    return (url == null || url == '')
        ? true
        : (urlRegex.hasMatch(url))
            ? true
            : false;
  }

  Future<File> getImage() async {
    ImagePicker picker = ImagePicker();
    // Let user select photo from gallery
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    File image =
        File(pickedFile!.path); // Use if you only need a single picture
    return image;
  }
}
