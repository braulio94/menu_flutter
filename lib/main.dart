import 'package:flutter/material.dart';
import 'package:menu/ui/customAppBar.dart';
import 'package:menu/model/menu.dart';
import 'package:menu/ui/newPager.dart';
import 'package:menu/view/animated_circle.dart';

void main() => runApp(new MyHomePage(title: 'Menu'));

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Menu',
        home: new Scaffold(
          body: new Stack(
            alignment: AlignmentDirectional.topEnd,
            children: <Widget>[
              new MenuPager(),
              new CustomAppBar(),
            ],
          ),
        ),
    );
  }
}

