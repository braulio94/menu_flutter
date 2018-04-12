import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:menu/model/food.dart';
import 'dart:math' as math;

class FoodImage extends StatelessWidget {
  FoodImage({this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'icon-${food.id}',
        child: Image(
          image: AssetImage(food.image),
          height: 150.0,
          width: 150.0,
        ),
    );
  }
}