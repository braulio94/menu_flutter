import 'package:flutter/material.dart';
import 'package:menu/model/food.dart';
import 'package:menu/model/menu.dart';
import 'package:menu/screens/details.dart';
import 'package:menu/view/animated_circle.dart';
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

  final PageController controller = new PageController(viewportFraction: 0.75);
  Color _backColor = const Color.fromRGBO(240, 232, 223, 1.0);
  final int _counter = 0;

  final List<Color> colors = <Color>[
    const Color.fromRGBO(240, 232, 223, 1.0),
    const Color.fromRGBO(214, 214, 198, 1.0),
    const Color.fromRGBO(209, 205, 190, 1.0),
    const Color.fromRGBO(239, 233, 219, 1.0),
    const Color.fromRGBO(207, 203, 188, 1.0),
    const Color.fromRGBO(231, 222, 211, 1.0),
    const Color.fromRGBO(217, 214, 198, 1.0)
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return new Stack(
      children: <Widget>[
        new Positioned.fill(bottom: screenHeight / 2,
            child: new Container(
                decoration: new BoxDecoration(color: _backColor))),
        new Align(alignment: Alignment.bottomCenter,
            child: new Padding(padding: const EdgeInsets.only(bottom: 50.0),
                child: new RectangleIndicator(
                    controller, Menu.menu.length, 6.0, Colors.grey[400],
                    Colors.black))),
        new Positioned.fill(
            child: new PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    _backColor =
                    colors[new math.Random().nextInt(colors.length)];
                  });
                },
                children: Menu.menu.map((Food food) {
                  return new Stack(
                    children: <Widget>[
                      new Center(
                        child: new Container(
                          width: 250.0,
                          height: 400.0,
                          child: new Stack(
                            children: <Widget>[
                              shadow2,
                              shadow1,
                              new Center(
                                  child: new Padding(
                                    padding: const EdgeInsets.only(top: 50.0),
                                    child: new Card(
                                      elevation: 7.0,
                                      child: new Container(
                                        height: math.min(300.0, MediaQuery
                                            .of(context)
                                            .size
                                            .height),
                                        child: new GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                            onTap: () => Navigator.pushNamed(context, DetailPage.routeName),
                                          child: new ItemCard(food: food),
                                        )
                                      ),
                                    ),
                                  )
                              ),
                              new Align(
                                  alignment: FractionalOffset.topCenter,
                                  child: new FoodImage(food: food)
                              ),
                            ],
                          ),
                        ),
                      ),
                      new AnimatedCircle(_counter),
                    ],
                  );
                }).toList()
            )
        ),
      ],
    );
  }
}
