import 'package:flutter/material.dart';
import 'package:menu/Routes.dart';
import 'package:menu/view/customAppBar.dart';
import 'package:menu/screens/pager.dart';

void main() {
  Routes.initRoutes();
  runApp(
      new MaterialApp(
        title: 'MENU',
        home: new MyHomePage(),
      )
  );
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          new MenuPager(),
        ],
      ),
    );
  }
}

