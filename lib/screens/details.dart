import 'package:flutter/material.dart';
import 'package:menu/model/food.dart';
import 'package:menu/model/menu.dart';
import 'package:menu/view/foodImage.dart';

class DetailPage extends StatelessWidget {

  final Food food;
  DetailPage(String id) : food = Menu.getFoodById(id);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Hero(
          tag: 'icon-${food.id}',
          child: new Image(
            image: new AssetImage(food.image),
            height: 150.0,
            width: 150.0,
          ),
        ),
      ),
    );
  }
}
