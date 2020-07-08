import 'package:flutter/material.dart';
import 'package:scfm/main.dart';
import 'package:scfm/screens/biometric_confirmation_screen.dart';
import 'package:scfm/screens/controls/appbar_title.dart';

import 'controls/ui_validator.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({Key key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final int _maxFormScreens = 2;
  int _formIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildForm(),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_backspace,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: AppBarTitle(),
    );
  }

  Widget _buildForm() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 64, 24, 0),
        child: IndexedStack(
          index: _formIndex,
          children: [
            _buildEmailForm(),
            _buildPasswordForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'What is your email ?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 32),
          child: Text(
            'You will use this email to login or if you need to reset your password in the future',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              color: ScfmApp.lightBlueTheme,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Set Password',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 32, 8, 24),
          child: TextField(
            textAlign: TextAlign.center,
            obscureText: true,
            style: TextStyle(
              fontSize: 23,
              color: ScfmApp.lightBlueTheme,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              UiValidator(
                text: 'more than 8 characters',
                isValid: true,
              ),
              SizedBox(height: 8),
              UiValidator(text: 'at least 1 number'),
              SizedBox(height: 8),
              UiValidator(text: 'at least 1 uppercase'),
              SizedBox(height: 8),
              UiValidator(text: 'at least 1 special character'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: FlatButton(
        onPressed: () {
          if (_formIndex < _maxFormScreens - 1) {
            setState(() {
              _formIndex++;
            });
            return;
          }
          if (_formIndex == _maxFormScreens - 1) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => BiometricConfirmationScreen(),
              ),
              ModalRoute.withName('biometrics'),
            );
            return;
          }
        },
        textColor: Colors.white,
        color: ScfmApp.blueTheme,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Center(
            child: Text(
              'Continue',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
