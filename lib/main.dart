import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu/routes.dart';
import 'package:menu/screens/pager.dart';

void main() {
  Routes.initRoutes();
  runApp(
      MaterialApp(
        title: 'MENU',
        home: MenuHomePage(),
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
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          MenuPager(),
        ],
      ),
    );
  }
}

