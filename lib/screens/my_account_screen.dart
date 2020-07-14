import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:scfm/screens/app.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScfmApp.bgTheme,
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      title: Text(
        'Accounts',
        style: TextStyle(color: Colors.black),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: ScfmApp.bgTheme,
                foregroundColor: ScfmApp.greenTheme,
                child: Icon(Icons.person),
              ),
              title: Text(
                'Link new account',
                style: TextStyle(color: ScfmApp.greenTheme),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      itemBuilder: (context, index) => _bankTile(),
      separatorBuilder: (context, index) => SizedBox(height: 16),
    );
  }
}

Widget _bankTile() {
  return Card(
    shape: ScfmApp.defaultRoundedBorder,
    child: Container(
      child: Column(
        children: [
          ListTile(
            leading: Container(
              height: 35,
              width: 35,
              decoration: ScfmApp.defaultRoundedBoxDecoration.copyWith(
                gradient: LinearGradient(
                  colors: [
                    ScfmApp.greenTheme,
                    ScfmApp.lightBlueTheme,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Icon(
                Icons.account_balance,
                color: Colors.white,
                size: 17.5,
              ),
            ),
            title: Text(
              'TransferWise',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'GBxx xxxx xxxx xxxx xxx6 34',
              style: TextStyle(
                fontSize: 11.5,
                color: ScfmApp.greyTheme,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 16, right: 16),
          //   child: Divider(),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(right: 8),
          //         child: Text(
          //           'Default Payout account',
          //           style: TextStyle(
          //             fontSize: 11.5,
          //             color: ScfmApp.greyTheme,
          //           ),
          //         ),
          //       ),
          //       Switch.adaptive(
          //         onChanged: (bool value) {},
          //         value: true,
          //         activeColor: ScfmApp.greenTheme,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    ),
  );
}
