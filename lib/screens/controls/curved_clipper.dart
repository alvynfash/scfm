import 'package:flutter/material.dart';

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..addRect(Rect.fromLTRB(
        0,
        0,
        size.width,
        size.height - 20,
      ))
      ..moveTo(0, size.height - 20)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 20,
      )
      ..close();
  }

  @override
  bool shouldReclip(CurvedClipper oldClipper) => false;
}
