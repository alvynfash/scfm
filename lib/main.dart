import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scfm/screens/startup_screen.dart';

void main() {
  runApp(ScfmApp());
}

class ScfmApp extends StatelessWidget {
  static Color blueTheme = Color(0xff0243BE);
  static Color lightBlueTheme = Color(0xff00B1EC);
  static Color greenTheme = Color(0xff40B193);
  static Color greyTheme = Color(0xff8193A4);
  static Color bgTheme = Color(0xffF5F6FA);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: StartUpScreen(),
    );
  }
}
