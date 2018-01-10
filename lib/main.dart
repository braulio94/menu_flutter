import 'package:flutter/material.dart';
import 'package:menu/ui/customAppBar.dart';
import 'package:menu/model/menu.dart';
import 'package:menu/ui/pageSelector.dart';

void main() => runApp(new MyHomePage(title: 'Menu'));

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Menu',
        home: new Scaffold(
          body: new Stack(
            alignment: AlignmentDirectional.topEnd,
            children: <Widget>[
              new DefaultTabController(
                length: Menu.menu.length,
                child: new PageSelector(),
              ),
              new CustomAppBar(),
              new Container(
                margin: new EdgeInsets.only(
                  top: 35.5,
                  right: 10.0,
                ),
                height: 15.0,
                width: 15.0,
                child: new CircleAvatar(
                  child: new Text('$_counter', textDirection: TextDirection.ltr,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w900)),
                  backgroundColor: Colors.amber[400],
                ),
              )
            ],
          ),
        ),
    );
  }
}

