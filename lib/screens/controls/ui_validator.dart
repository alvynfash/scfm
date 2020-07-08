import 'package:flutter/material.dart';
import 'package:scfm/main.dart';

class UiValidator extends StatefulWidget {
  final String text;
  final bool isValid;
  UiValidator({this.text, this.isValid = false, Key key}) : super(key: key);

  @override
  _UiValidatorState createState() => _UiValidatorState();
}

class _UiValidatorState extends State<UiValidator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: widget.isValid ? ScfmApp.lightBlueTheme : ScfmApp.greyTheme,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(.75),
            ),
          ),
        ),
      ],
    );
  }
}
