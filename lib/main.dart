import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'parallax_widget.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parallax Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Kiddopia Practical task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // top
  double space = 0;
  double mercury = 100;
  double venus = 200;
  double earth = 300;
  double mars = 400;
  double jupiter = 600;
  double rocket = 300;

  // height width
  double mercuryHW = 50;
  double venusHW = 120;
  double earthHW = 100;
  double marsHW = 70;
  double jupiterHW = 200;
  double rocketHW = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            setState(() {
              mercury = mercury - v.scrollDelta / 2.5;
              venus = venus - v.scrollDelta / 4.5;
              earth = earth - v.scrollDelta / 3;
              mars = mars - v.scrollDelta / 6;
              jupiter = jupiter - v.scrollDelta / 1.5;
              rocket = rocket - v.scrollDelta / 2.5;

              mercuryHW = mercuryHW + v.scrollDelta / 100;
              venusHW = venusHW + v.scrollDelta / 100;
              earthHW = earthHW + v.scrollDelta / 100;
              marsHW = marsHW + v.scrollDelta / 100;
              jupiterHW = jupiterHW + v.scrollDelta / 100;
              rocketHW = (rocketHW - v.scrollDelta / 10.5) < 5
                  ? 5
                  : (rocketHW - v.scrollDelta / 10.5);
            });
          }
          return true;
        },
        child: Stack(
          children: [
            /// space view
            ..._spaceBG(),

            /// planets
            ..._planets(),

            /// other items
            ..._otherSpaceItems(),

            /// listview to scroll or we can use gridview
            ListView(
              children: [
                Container(
                  height: 1000,
                  color: Colors.transparent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _spaceBG() {
    return [
      Positioned(
        top: space,
        left: -45,
        child: Container(
          height: 600 - mercury,
          width: 900,
          child: Image.asset(
            "assets/space.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];
  }

  List<Widget> _planets() {
    return [
      ParallaxWidget(
          top: mercury,
          left: 100,
          heightWidth: mercuryHW,
          rotation: mercury / 50,
          asset: "mercury.png"),
      ParallaxWidget(
          top: venus,
          left: 200,
          heightWidth: venusHW,
          rotation: venus / 50,
          asset: "venus.png"),
      ParallaxWidget(
          top: earth,
          left: 300,
          heightWidth: earthHW,
          rotation: earth / 50,
          asset: "earth.png"),
      ParallaxWidget(
          top: mars,
          left: 400,
          heightWidth: marsHW,
          rotation: mars / 50,
          asset: "mars.png"),
      ParallaxWidget(
          top: jupiter,
          left: 500,
          rotation: jupiter / 150,
          heightWidth: jupiterHW,
          asset: "jupiter.png"),
    ];
  }

  List<Widget> _otherSpaceItems() {
    return [
      /// rocket
      ParallaxWidget(
          top: rocket,
          left: rocket,
          heightWidth: rocketHW,
          rotation: 80,
          asset: "rocket.png"),
    ];
  }
}
