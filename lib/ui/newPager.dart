import 'package:flutter/material.dart';
import 'package:menu/model/food.dart';
import 'package:menu/model/menu.dart';
import 'package:menu/view/cartButton.dart';
import 'package:menu/view/rectangle_indicator.dart';
import 'package:menu/view/foodImage.dart';
import 'package:menu/view/itemCard.dart';

class MenuPager extends StatefulWidget {
  @override
  _MenuPagerState createState() => new _MenuPagerState();
}


class _MenuPagerState extends State<MenuPager> {

  final PageController controller = new PageController();
  final int _counter = 0;
  MaterialColor _backColor = Colors.white;


//  _MenuPagerState({
//      setState(() {
//          final List<MaterialColor> options = <MaterialColor>[];
//          if (_logoColor != Colors.blue)
//          options.addAll(<MaterialColor>[Colors.blue, Colors.blue, Colors.blue, Colors.blue, Colors.blue, Colors.blue, Colors.blue]);
//          if (_logoColor != Colors.amber)
//          options.addAll(<MaterialColor>[Colors.amber, Colors.amber, Colors.amber]);
//          if (_logoColor != Colors.red)
//          options.addAll(<MaterialColor>[Colors.red, Colors.red, Colors.red]);
//          if (_logoColor != Colors.indigo)
//          options.addAll(<MaterialColor>[Colors.indigo, Colors.indigo, Colors.indigo]);
//          if (_logoColor != Colors.pink)
//          options.addAll(<MaterialColor>[Colors.pink]);
//          if (_logoColor != Colors.purple)
//          options.addAll(<MaterialColor>[Colors.purple]);
//          if (_logoColor != Colors.cyan)
//          options.addAll(<MaterialColor>[Colors.cyan]);
//          _logoColor = options[new math.Random().nextInt(options.length)];
//      });
//  });

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.only(top: 16.0,),
        decoration: new BoxDecoration(
            color: _backColor.shade500,
        ),
        child: new Stack(
          alignment: FractionalOffset.bottomCenter,
          children: <Widget>[
            new PageView(
              controller: controller,
              //onPageChanged: ,
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
                child: new RectangleIndicator(controller, Menu.menu.length, 5.0, Colors.grey, Colors.black)
            ),
          ],
        ),
      ),
    );
  }
}
