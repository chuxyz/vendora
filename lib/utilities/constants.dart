import 'package:flutter/material.dart';

const String kAppName = 'Vendora';
const Color kThemeColor = Colors.deepPurpleAccent;
const Widget kTextFieldSpacing = SizedBox(height: 10.0, width: double.infinity);
// boxShadow: [
// BoxShadow(
// color: Colors.grey.withOpacity(0.3),
// spreadRadius: 3,
// blurRadius: 2,
// offset: Offset(0, 3),
// ),
// ],
const Map<int, Map<String, String>?> kCategories = {
  1: {
    'img': 'images/vendor-categories/art-culture.png',
    'caption': 'Arts & Culture'
  },
  2: {
    'img': 'images/vendor-categories/car-service.png',
    'caption': 'Auto Sales & Services'
  },
  3: {
    'img': 'images/vendor-categories/business-building.png',
    'caption': 'Business Services'
  },
  4: {'img': 'images/vendor-categories/education.png', 'caption': 'Education'},
  5: {
    'img': 'images/vendor-categories/entertainment.png',
    'caption': 'Entertainment'
  },
  6: {
    'img': 'images/vendor-categories/health-checkup.png',
    'caption': 'Health & Wellness'
  },
  7: {
    'img': 'images/vendor-categories/home-improvement.png',
    'caption': 'Home Improvement'
  },
  8: {
    'img': 'images/vendor-categories/internet-services.png',
    'caption': 'Internet & Web Services'
  },
  9: {
    'img': 'images/vendor-categories/policy-document.png',
    'caption': 'Legal Services'
  },
  10: {
    'img': 'images/vendor-categories/hotel.png',
    'caption': 'Lodging & Travel'
  },
  11: {
    'img': 'images/vendor-categories/advert.png',
    'caption': 'Marketing & Advertising'
  },
  12: {'img': 'images/vendor-categories/news.png', 'caption': 'News & Media'},
  13: {
    'img': 'images/vendor-categories/pets-services.png',
    'caption': 'Pet Services'
  },
  14: {
    'img': 'images/vendor-categories/real-estate.png',
    'caption': 'Real Estate'
  },
  15: {
    'img': 'images/vendor-categories/restaurant.png',
    'caption': 'Restaurants & Bar'
  },
  16: {
    'img': 'images/vendor-categories/retail.png',
    'caption': 'Shopping & Retail'
  },
  17: {
    'img': 'images/vendor-categories/swimming-pool.png',
    'caption': 'Sports & Recreational'
  },
  18: {
    'img': 'images/vendor-categories/red-carpet.png',
    'caption': 'Wedding, Events & Meetings'
  }
};

Map<String, String> errorMsg = {
  'firstName': 'First name must be alphabet and greater than two characters',
  'lastName': 'Last name must be alphabet and greater than two characters',
  'email': 'It seems you didn\'t type a valid email address',
  'password':
      'Password should be at least 8 characters and contain at least one letter and number',
  'phone': 'You must have typed an invalid phone number. Try again!',
  'confirmPassword': 'Password does not match',
};
