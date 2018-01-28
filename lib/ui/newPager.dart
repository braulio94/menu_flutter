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

  final PageController controller = new PageController(viewportFraction: 0.8);
  final int _counter = 0;
  int pageNumber = 0;

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
                  controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                });
              },
              controller: controller,
                children: Menu.menu.map((Food food) {
                  return new Container(
                    key: new ObjectKey(food),
                    child: new Stack(
                      children: <Widget>[
                        new Center(
                          child: new Container(
                            height: 10.0,
                            width: 100.0,
                            margin: const EdgeInsets.only(top: 250.0),
                            decoration: new BoxDecoration(
                                boxShadow: <BoxShadow>[
//                                  new BoxShadow(color: Colors.amber[400],
//                                      blurRadius: 30.0,
//                                      spreadRadius: 10.0,
//                                      offset: new Offset(0.0, 50.0)),
                                  new BoxShadow(color: Colors.grey[800],
                                      blurRadius: 35.0,
                                      spreadRadius: 10.0,
                                      offset: new Offset(0.0, 50.0)),
                                ]
                            ),
                          ),
                        ),
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
