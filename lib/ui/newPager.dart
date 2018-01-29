import 'package:flutter/material.dart';
import 'package:menu/model/food.dart';
import 'package:menu/model/menu.dart';
import 'package:menu/view/cartButton.dart';
import 'package:menu/view/rectangle_indicator.dart';
import 'package:menu/view/foodImage.dart';
import 'package:menu/view/itemCard.dart';
import 'package:menu/view/shadows.dart';
import 'dart:math' as math;

class MenuPager extends StatefulWidget {
  @override
  _MenuPagerState createState() => new _MenuPagerState();
}


class _MenuPagerState extends State<MenuPager> {

  final PageController controller = new PageController(viewportFraction: 0.8);
  Color _backColor = Colors.white;
  final int _counter = 0;
  int pageNumber = 0;

  final List<Color> colors = <Color>[
    const Color.fromRGBO(240, 232, 223, 1.0),
    const Color.fromRGBO(214, 214, 198, 1.0),
    const Color.fromRGBO(209, 205, 190, 1.0),
  Colors.brown[50],
    const Color.fromRGBO(207, 203, 188, 1.0),
    Colors.brown[100],
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.only(top: 16.0),
        decoration: new BoxDecoration(
          color: _backColor
        ),
        child: new Stack(
          alignment: FractionalOffset.bottomCenter,
          children: <Widget>[
            new Container(
                padding: const EdgeInsets.only(top: 250.0, right: 80.0, left: 80.0, bottom: 50.0),
                decoration: new BoxDecoration(
                    color: Colors.white
                ),
                margin: new EdgeInsets.only(
                    top: 50.0,
                    bottom: 0.0
                ),
                child: new RectangleIndicator(controller, Menu.menu.length, 0.0, Colors.grey, Colors.black)
            ),
            new PageView(
              onPageChanged: (index){
                setState((){
                  _backColor = colors[new math.Random().nextInt(colors.length)];
                });
              },
              controller: controller,
                children: Menu.menu.map((Food food) {
                  return new Container(
                    key: new ObjectKey(food),
                    child: new Stack(
                      children: <Widget>[
                        shadow2,
                        shadow1,
                        new Container(
                          height: 400.0,
                          margin:  const EdgeInsets.only(top: 80.0),
                          padding: const EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0),
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
          ],
        ),
      ),
    );
  }
}
