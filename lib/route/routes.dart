import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teman/screen/WASplashScreen.dart';
import 'package:teman/screen/WATambahLokasiBahaya.dart';

import '../screen/WAHomeScreen.dart';
import '../screen/WAMap.dart';

class MyRoute {
  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (BuildContext context) => WASplashScreen());
      case "/home":
        return MaterialPageRoute(
            builder: (BuildContext context) => WAHomeScreen());
      case "/tambahbahaya":
        return MaterialPageRoute(
            builder: (BuildContext context) => WATambahLokasiBahaya());
      case "/map":
        return MaterialPageRoute(
            builder: (BuildContext context) => CustomizeMarkerExample());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => WAHomeScreen());
    }
  }
}
