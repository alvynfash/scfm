import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:scfm/screens/app.dart';
import 'package:scfm/screens/controls/radial_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: _buildMenus(),
    );
  }

  Widget _buildAppbar() {
    return GradientAppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '£', style: TextStyle(fontSize: 25)),
                TextSpan(text: '92', style: TextStyle(fontSize: 30)),
                TextSpan(text: '.50', style: TextStyle(fontSize: 17)),
              ],
            ),
          ),
          Text(
            'Available balance',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {
            Get.bottomSheet(
              _buildMoreOptions(),
              backgroundColor: Colors.white,
            );
          },
        ),
      ],
      centerTitle: false,
      bottom: PreferredSize(
        child: Container(),
        preferredSize: Size.fromHeight(25),
      ),
      gradient: LinearGradient(
        colors: [ScfmApp.lightBlueTheme, ScfmApp.greenTheme],
      ),
    );
  }

  Widget _buildMenus() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Container(
            child: Column(
              children: [
                _buildAccountCard(),
                _buildActivities(),
                _buildVerification(),
                _buildShareCard(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAccountCard() {
    return Card(
      shape: ScfmApp.defaultRoundedBorder,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildAmountsOverview(),
        ),
      ),
    );
  }

  Widget _buildAmountsOverview() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _amountTile(
          title: 'Invested',
          amount: 1000,
          iconColor: Colors.redAccent,
        ),
        _amountTile(
          title: 'Earned',
          amount: 238,
          iconColor: ScfmApp.greenTheme,
        ),
      ],
    );
  }

  Widget _buildActivities() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerTile('Activity'),
        Container(
          height: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _activityTile(
                text: 'Payouts',
                icon: Icons.show_chart,
              ),
              _activityTile(
                text: 'Accounts',
                icon: Icons.account_balance_wallet,
                onTap: () => Get.toNamed('myAccountsScreen'),
              ),
              _buildPayoutActivityTile(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVerification() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerTile('Complete verification'),
        Card(
          shape: ScfmApp.defaultRoundedBorder,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '60%',
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        '3 of 10 completed',
                        style: TextStyle(color: ScfmApp.greyTheme),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: LinearPercentIndicator(
                    lineHeight: 8,
                    percent: .6,
                    linearGradient: LinearGradient(
                      colors: [ScfmApp.greenTheme, ScfmApp.lightBlueTheme],
                    ),
                  ),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      _buildVerificationOptionTile(
                        text: 'Personal information',
                        description:
                            'Needed to confirm your identity when communicating with our support',
                        icon: Icons.person,
                      ),
                      SizedBox(height: 16),
                      _buildVerificationOptionTile(
                        text: 'Verification',
                        icon: Icons.verified_user,
                      ),
                      SizedBox(height: 16),
                      _buildVerificationOptionTile(
                        text: 'Confirm email',
                        icon: Icons.email,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShareCard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerTile('Promo'),
        Card(
          shape: ScfmApp.defaultRoundedBorder,
          child: Column(
            children: [
              _buildPromoTopDesign(),
              _buildPromoBottomMessage(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPayoutActivityTile() {
    return Card(
      shape: ScfmApp.defaultRoundedBorder,
      child: Container(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: RadialIndicator(
                  bgColor: ScfmApp.lightBlueTheme,
                  progressColor: ScfmApp.greenTheme,
                  percent: 1 / 5,
                  text: '1',
                  radius: 50,
                ),
              ),
              Text(
                'Active Crew',
                style: TextStyle(
                  fontSize: 13,
                  color: ScfmApp.greyTheme,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerificationOptionTile(
      {String text = '',
      String description = '',
      IconData icon = Icons.android}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.orange,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              SizedBox(
                height: 8,
              ),
              description.isNotEmpty
                  ? SizedBox(
                      width: 250,
                      child: Text(
                        description,
                        style: TextStyle(color: ScfmApp.greyTheme),
                      ))
                  : SizedBox(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPromoBottomMessage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Share and invite your friends !',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Invite friends to register on our app and earn up to 20£ for every user who invests.',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Invite now',
                      style: TextStyle(color: ScfmApp.greenTheme),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoTopDesign() {
    return Container(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: ScfmApp.greenTheme,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              'assets/svg/savings.svg',
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32),
              child: Text(
                'Get 20£ free !',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoreOptions() {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(
              Icons.notifications_active,
              color: ScfmApp.greenTheme,
            ),
            title: Text('Enable notifications'),
            trailing: Switch.adaptive(
              onChanged: (bool value) {},
              value: true,
              activeColor: ScfmApp.greenTheme,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(
              Icons.lock,
              color: ScfmApp.greenTheme,
            ),
            title: Text('Log in with biometirc'),
            trailing: Switch.adaptive(
              onChanged: (bool value) {},
              value: true,
              activeColor: ScfmApp.greenTheme,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(
              Icons.email,
              color: ScfmApp.greenTheme,
            ),
            title: Text('Alerts'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(
              Icons.chat_bubble,
              color: ScfmApp.greenTheme,
            ),
            title: Text('Chat with an agent'),
          ),
        ],
      ),
    );
  }
}

Widget _headerTile(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, top: 32, bottom: 12),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _activityTile(
    {String text, IconData icon = Icons.android, Function onTap}) {
  return GestureDetector(
    onTap: () => onTap?.call(),
    child: Card(
      shape: ScfmApp.defaultRoundedBorder,
      child: Container(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ScfmApp.greenTheme,
                      ScfmApp.lightBlueTheme,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 50,
                width: 50,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 13,
                  color: ScfmApp.greyTheme,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _amountTile({
  String title,
  double amount,
  Color iconColor = Colors.red,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundColor: iconColor,
        radius: 6,
      ),
      SizedBox(
        width: 16,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 13, color: ScfmApp.greyTheme),
          ),
          SizedBox(height: 4),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: '£${amount.toString().split(".").first}',
                style: TextStyle(fontSize: 20),
              ),
              TextSpan(
                text: '.${amount.toStringAsFixed(2).split(".").last}',
                style: TextStyle(fontSize: 14),
              ),
            ]),
          ),
        ],
      ),
    ],
  );
}
