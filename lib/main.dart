import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu/routes.dart';
import 'package:menu/screens/pager.dart';

void main() {
  Routes.initRoutes();
  runApp(
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MENU',
        home: new MenuHomePage(),
      )
  );
}

class MenuHomePage extends StatelessWidget {

  MenuHomePage(){
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
  }

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
