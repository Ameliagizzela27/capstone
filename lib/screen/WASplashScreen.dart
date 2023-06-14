import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:teman/utils/WAColors.dart';

class WASplashScreen extends StatefulWidget {
  static String tag = '/WASplashScreen';

  @override
  WASplashScreenState createState() => WASplashScreenState();
}

class WASplashScreenState extends State<WASplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(WAPrimaryColor2,
        statusBarIconBrightness: Brightness.light);
    await Future.delayed(Duration(seconds: 3));
    if (mounted) finish(context);

    Navigator.pushNamed(context, "/home");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WASecondary4,
        body: Stack(
          children: [
            Positioned(
              top: -450,
              left: -300,
              child: CircleAvatar(
                radius: 300,
                backgroundColor: WAPrimaryColor2,
              ),
            ),
            Positioned(
              top: -350,
              right: -300,
              child: CircleAvatar(
                radius: 300,
                backgroundColor: WAPrimaryColor2,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                60.height,
                Image.asset(
                  'assets/logo_teman.png',
                  // color: Colors.white,
                  fit: BoxFit.fitWidth,
                  width: 0.8 * MediaQuery.of(context).size.width,
                ).center(),
              ],
            ),
            Positioned(
              bottom: -450,
              left: -300,
              child: CircleAvatar(
                radius: 300,
                backgroundColor: WAPrimaryColor2,
              ),
            ),
          ],
        ));
  }
}
