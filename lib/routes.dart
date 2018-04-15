import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:menu/screens/details.dart';

class Routes {
  static final Router _router = new Router();

  static void initRoutes() {
    _router.define("/detail/:id", handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new DetailPage(params["id"]);
        }));
  }

  static void navigateTo(context, String route) {
    _router.navigateTo(context, route);
  }

}