import 'package:flutter/material.dart';
import 'package:scfm/main.dart';
import 'package:scfm/screens/controls/appbar_title.dart';
import 'package:scfm/screens/controls/radial_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: ListView(
          children: [
            // _buildNotificationBoard(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Placeholder(),
              ),
            ),
            // Container(
            //   height: 200,
            //   // color: Colors.red,
            //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       // cr
            //       children: [
            //         RadialIndicator(
            //           text: '1',
            //           percent: .33,
            //           bgColor: Colors.orangeAccent,
            //           progressColor: Colors.green,
            //           // radius: 60,
            //         ),
            //         RadialIndicator(
            //           text: '2',
            //           percent: .66,
            //           bgColor: Colors.orangeAccent,
            //           progressColor: Colors.green,
            //           // radius: 60,
            //         ),
            //       ]),
            // ),
            // _buildDashboard(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      // title: AppBarTitle(),
      actions: [
        IconButton(
          color: ScfmApp.lightBlueTheme,
          icon: Icon(
            Icons.email,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildNotificationBoard() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hello, Ifeoluwa',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Start investing in your future !',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboard() {
    return SliverFillRemaining(
      child: _buildRest(),
      // child: SingleChildScrollView(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       // _buildGraph(),
      //       // _buildAddGoalLayout(),
      //       _buildRest(),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildGraph() {
    return Container(
      height: 200,
      color: Colors.red,
      child: Placeholder(),
    );
  }

  Widget _buildAddGoalLayout() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => {},
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add new goal',
                    style: TextStyle(
                      fontSize: 17,
                      color: ScfmApp.lightBlueTheme,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.add_circle_outline,
                      color: ScfmApp.lightBlueTheme,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRest() {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: 40,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundColor: ScfmApp.greenTheme,
          foregroundColor: Colors.white,
          radius: 30,
          child: Text(
            '25',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text('Alvyn Fasuyi'),
        subtitle: SizedBox(
          width: 60,
          child: LinearProgressIndicator(
            minHeight: 6,
            backgroundColor: ScfmApp.greyTheme.withOpacity(.5),
            valueColor: AlwaysStoppedAnimation<Color>(ScfmApp.greenTheme),
            value: .4,
          ),
        ),
        trailing: Text('on track'),
      ),
      separatorBuilder: (context, index) => Divider(),
    );
  }
}
