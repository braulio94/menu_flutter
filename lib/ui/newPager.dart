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
  int pageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.only(top: 16.0),
        decoration: new BoxDecoration(
          color: Colors.brown[pageNumber * 100]
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
                  pageNumber = index;
                });
              },
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
                          // Code to customize card shadow

//                          decoration: new BoxDecoration(
//                              boxShadow: <BoxShadow>[
//                                new BoxShadow(color: Colors.black26,
//                                    blurRadius: 50.0,
//                                    spreadRadius: 6.0,
//                                    offset: new Offset(10.0, 10.0)),
//                              ]
//                          ),
                          child: new Card(
                              elevation: 0.0,
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
