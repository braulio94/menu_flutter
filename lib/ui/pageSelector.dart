import 'package:flutter/material.dart';
import 'package:menu/model/food.dart';
import 'package:menu/model/menu.dart';
import 'package:menu/view/itemCard.dart';
import 'package:menu/view/cartButton.dart';
import 'package:menu/view/foodImage.dart';

class PageSelector extends StatelessWidget {
  final int _counter = 0;
  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    return new SafeArea(
      top: false,
      bottom: false,
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new TabBarView(
                children: Menu.menu.map((Food food) {
                  return new Container(
                    key: new ObjectKey(food),
                    child: new Stack(
                      children: <Widget>[
                        new Container(
                          width: 300.0,
                          height: 400.0,
                          margin: const EdgeInsets.only(top: 150.0, bottom: 80.0, left: 40.0, right: 40.0),
                          child: new Card(
                              elevation: 7.0,
                              child: new ItemCard(food: food)
                          ),
                        ),
                        new FoodImage(food: food),
                        new CartButton(_counter),
                      ],
                    ),
                  );
                }).toList()
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: new TabPageSelector(controller: controller, indicatorSize: 5.0, selectedColor: Colors.amber[600]),
          ),
        ],
      ),
    );
  }
}