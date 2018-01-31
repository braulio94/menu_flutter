import 'package:flutter/material.dart';
import 'package:menu/model/food.dart';

class FoodImage extends StatelessWidget {
  FoodImage({this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 100.0),
      child: new Hero(
        tag: 'icon-${food.id}',
        child: new Image(
          image: new AssetImage(food.image),
          height: 150.0,
          width: 150.0,
        ),
      ),
    );
  }
}