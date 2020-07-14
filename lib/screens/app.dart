import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scfm/screens/screens.dart';

class ScfmApp extends StatefulWidget {
  static Color blueTheme = Color(0xff0243BE);
  static Color lightBlueTheme = Color(0xff00B1EC);
  static Color greenTheme = Color(0xff40B193);
  static Color greyTheme = Color(0xff8193A4);
  static Color bgTheme = Color(0xffF5F6FA);

  static BoxDecoration defaultThemedBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        ScfmApp.greenTheme,
        ScfmApp.lightBlueTheme,
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
  );

  static BoxDecoration defaultRoundedBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
  );

  static BoxDecoration defaultRoundedBottomBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
    ),
  );

  static BoxDecoration defaultRoundedTopBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
  );

  static RoundedRectangleBorder defaultRoundedBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  );

  @override
  _ScfmAppState createState() => _ScfmAppState();
}

class _ScfmAppState extends State<ScfmApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: StartUpScreen(),
      defaultTransition: Transition.topLevel,
      getPages: [
        GetPage(name: 'splashScreen', page: () => SplashScreen()),
        GetPage(name: 'startupScreen', page: () => StartUpScreen()),
        GetPage(name: 'createAccountScreen', page: () => CreateAccountScreen()),
        GetPage(
            name: 'biometricConfirmationScreen',
            page: () => BiometricConfirmationScreen()),
        GetPage(name: 'homeScreen', page: () => HomeScreen()),
        GetPage(name: 'myAccountsScreen', page: () => MyAccountScreen()),
      ],
    );
  }
}
