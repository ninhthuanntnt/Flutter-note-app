import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:keepapp/model/NoteModel.dart';
import 'package:keepapp/utils/AppConstants.dart';
import 'package:keepapp/utils/Exceptions.dart';
import 'package:keepapp/utils/Utils.dart';

String parent =
    "projects/ntnt-1999/databases/(default)/documents/notes/${Utils.userId}/data/";

/// To work on Notes List
String NOTE_API =
    "https://firestore.googleapis.com/v1/projects/ntnt-1999/databases/(default)/documents/notes/${Utils.userId}/data/";

/// To work on Notes List
String USER_DATA_API =
    "https://firestore.googleapis.com/v1/projects/ntnt-1999/databases/(default)/documents/notes/${Utils.userId}/";

/// Register User
const registerUserApi =
    "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${AppConstants.API_KEY}";

/// Login Existing User with Email and Password
const signInApi =
    "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${AppConstants.API_KEY}";

/// Login Existing User with Token
const loginWithApiToken =
    "https://www.googleapis.com/identitytoolkit/v3/relyingparty/getAccountInfo?key=${AppConstants.API_KEY}";

/// Send reset password email to user
const passwordResetApi =
    "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=${AppConstants.API_KEY}";
