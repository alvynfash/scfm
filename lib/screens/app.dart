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

  static BoxDecoration ddefaultBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        ScfmApp.greenTheme,
        ScfmApp.lightBlueTheme,
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: StartUpScreen(),
      unknownRoute: GetPage(
        name: 'unknown',
        page: () => UnkownScreen(),
        transition: Transition.downToUp,
      ),
      getPages: [
        GetPage(
          name: 'splashScreen',
          page: () => SplashScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: 'startupScreen',
          page: () => StartUpScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: 'createAccountScreen',
          page: () => CreateAccountScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: 'biometricConfirmationScreen',
          page: () => BiometricConfirmationScreen(),
        ),
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
      ],
    );
  }
}
