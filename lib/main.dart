import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keepapp/blocs/HomeBloc.dart';
import 'package:keepapp/blocs/LoginBloc.dart';
import 'package:keepapp/screen/LoginPage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

main() {
  if (defaultTargetPlatform != TargetPlatform.android ||
      defaultTargetPlatform != TargetPlatform.iOS) {
    /// For desktop apps only
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginBloc()),
      ChangeNotifierProvider(create: (context) => HomeBloc()),
    ],
    //   create: (context) => LoginBloc(),
    child: OverlaySupport(
      child: MaterialApp(
        home: LoginPage(),
        theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryColor: Colors.deepPurple,
          accentColor: Color(0xffff470b),
          primaryIconTheme: IconThemeData(color: Colors.deepPurple),
          iconTheme: IconThemeData(color: Colors.white),
          accentIconTheme: IconThemeData(color: Color(0xffff470b)),
        ),
        debugShowCheckedModeBanner: false,
      ),
    ),
  ));
}
