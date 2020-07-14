import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:scfm/screens/app.dart';

class BiometricConfirmationScreen extends StatefulWidget {
  BiometricConfirmationScreen({Key key}) : super(key: key);

  @override
  _BiometricConfirmationScreenState createState() =>
      _BiometricConfirmationScreenState();
}

class _BiometricConfirmationScreenState
    extends State<BiometricConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildMessage(),
            _buildButtons(),
            // _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage() {
    return Expanded(
      // color: Colors.blue,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Icon(
                  Icons.fingerprint,
                  size: 125,
                  color: ScfmApp.greenTheme,
                ),
              ),
              Text(
                'Do you want to log in with \nTouch ID next time?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'To avoid typing your password \neach  time',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: FlatButton(
            onPressed: () => Get.offAllNamed('homeScreen'),
            textColor: Colors.white,
            color: ScfmApp.blueTheme,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Center(
                child: Text(
                  'Use Touch ID',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.offAllNamed('homeScreen'),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.transparent,
            child: Text(
              'No thanks',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: ScfmApp.blueTheme,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
