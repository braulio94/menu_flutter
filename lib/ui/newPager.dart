import 'package:flutter/material.dart';
import 'package:menu/model/food.dart';
import 'package:menu/model/menu.dart';
import 'package:menu/view/cartButton.dart';
import 'package:menu/view/rectangle_indicator.dart';
import 'package:menu/view/foodImage.dart';
import 'package:menu/view/itemCard.dart';


class MenuPager extends StatelessWidget {

  final PageController controller = new PageController();
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.only(top: 16.0,),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [Colors.yellow[100],Colors.white],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 0.8),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
          ),
        ),
        child: new Stack(
          alignment: FractionalOffset.bottomCenter,
          children: <Widget>[
            new PageView(
              controller: controller,
                children: Menu.menu.map((Food food) {
                  return new Container(
                    key: new ObjectKey(food),
                    child: new Stack(
                      children: <Widget>[
                        new Container(
                          height: 400.0,
                          margin:  const EdgeInsets.only(top: 80.0),
                          padding: const EdgeInsets.only(top: 60.0, left: 40.0, right: 40.0),
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
            new Container(
                margin: new EdgeInsets.only(
                  top: 50.0,
                  bottom: 50.0,
                ),
                child: new RectangleIndicator(controller, Menu.menu.length, 0.0, Colors.grey, Colors.black)
            ),
          ],
        ),
      ),
    );
  }
}
