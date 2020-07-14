import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:scfm/screens/app.dart';

const baseUrl =
    'https://42f2671d685f51e10fc6-b9fcecea3e50b3b59bdc28dead054ebc.ssl.cf5.rackcdn.com/illustrations';

class StartUpScreen extends StatefulWidget {
  StartUpScreen({Key key}) : super(key: key);

  @override
  _StartUpScreenState createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _buildImage(),
              _buildInfoMessage(),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      child: SvgPicture.asset(
        'assets/svg/savings.svg',
        height: _size.height * .4,
        matchTextDirection: true,
      ),
    );
  }

  Widget _buildInfoMessage() {
    return Expanded(
      // color: Colors.blue,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Stay on top of your \nfinances',
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
              'As your financial advisors, we can recommend the right investment accounts for you',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
          ],
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
            onPressed: () => Get.toNamed('createAccountScreen'),
            color: ScfmApp.blueTheme,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => print('Sign in tapped'),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.transparent,
            child: Text(
              'Sign In',
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
