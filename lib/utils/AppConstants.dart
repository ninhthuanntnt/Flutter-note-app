import 'package:flutter/material.dart' as material;

class AppConstants {
  static const String AppName = "NoteApp";

  // TODO: Replace your key here
  static const String API_KEY = "AIzaSyCSksDPfS53ZpfvO0-ST1lgxZiQLtKE_Mk";

  static material.Color orangeColor = const material.Color(0xffff470b);
  static material.Color yellowColor = const material.Color(0xfffca10e);

  static List socialLinks = [
    {
      'name': 'github',
      "link": 'https://github.com/ninhthuanntnt',
      'icon': 'assets/images/github.png'
    },
    {
      'name': 'linkedin',
      "link": 'https://www.linkedin.com/in/ninhthuanntnt',
      'icon': 'assets/images/linkedin.png'
    },
    {
      'name': 'website',
      "link": 'https://navoki.com',
      'icon': 'assets/images/website.png'
    },
  ];

// Keys Constants
  static const EMAIL = "email";
  static const PASSWORD = "password";
  static const API_TOKEN = "token";
  static const LOCAL_ID = "localId";
  static const REQUEST_TYPE = "requestType";
}
