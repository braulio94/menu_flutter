import 'dart:async';
import 'package:flutter/scheduler.dart' show timeDilation ;
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:menu/routes.dart';
import 'package:menu/model/food.dart';
import 'package:menu/model/menu.dart';
import 'package:menu/widgets/customAppBar.dart';
import 'package:menu/widgets/animated_circle.dart';
import 'package:menu/widgets/rectangle_indicator.dart';
import 'package:menu/widgets/foodImage.dart';
import 'package:menu/widgets/itemCard.dart';
import 'package:menu/widgets/shadows.dart';
import 'dart:math' as math;

class MenuPager extends StatefulWidget {
  @override
  _MenuPagerState createState() => new _MenuPagerState();
}

const double _kViewportFraction = 0.75;

class _MenuPagerState extends State<MenuPager> with TickerProviderStateMixin {

  final PageController _backgroundPageController = new PageController();
  final PageController _pageController = new PageController(viewportFraction: _kViewportFraction);
  ValueNotifier<double> selectedIndex = new ValueNotifier<double>(0.0);
  Color _backColor = const Color.fromRGBO(240, 232, 223, 1.0);
  final int _counter = 0;
  AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 700),
        vsync: this
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  Future<Null> playAnimation() async {
    try {
      await controller.forward().orCancel;
      await controller.reverse().orCancel;
    } on TickerCanceled{

    }
  }

  final List<Color> colors = <Color>[
    const Color.fromRGBO(240, 232, 223, 1.0),
    const Color.fromRGBO(214, 214, 198, 1.0),
    const Color.fromRGBO(209, 205, 190, 1.0),
    const Color.fromRGBO(239, 233, 219, 1.0),
    const Color.fromRGBO(207, 203, 188, 1.0),
    const Color.fromRGBO(231, 222, 211, 1.0),
    const Color.fromRGBO(217, 214, 198, 1.0),
  ];

  _contentWidget(Food food, Alignment alignment, double resize) {
    return new Stack(
      children: <Widget>[
        new Center(
          child: new Container(
            alignment: alignment,
            width: 300.0 * resize,
            height: 400.0 * resize,
            child: new Stack(
              children: <Widget>[
                shadow2,
                shadow1,
                new Center(
                  child: new Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: new Card(
                      elevation: 0.0,
                      child: new Container(
                        height: math.min(300.0, MediaQuery
                            .of(context)
                            .size
                            .height),
                        child: new GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () =>
                              Routes.navigateTo(
                                  context,
                                  '/detail/${food.id}',
                                  transition: TransitionType.fadeIn
                              ),
                          child: new ItemCard(food: food),
                        ),
                      ),
                    ),
                  ),
                ),
                new Align(
                    alignment: FractionalOffset.topCenter,
                    child: new FoodImage(food: food),
                ),
                new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: new SizedBox(
                    width: 70.0,
                    height: 50.0,
                    child: new MaterialButton(
                      highlightColor: Colors.grey[400],
                      onPressed: (){
                        playAnimation();
                      },
                      elevation: _counter == 0 ? 10.0 : 5.0,
                      color: _counter == 0 ? Colors.grey[350] : Colors.amber,
                      child: new Icon(
                          const IconData(
                              0xe807,
                              fontFamily: 'fontello'), size: 20.0,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Iterable<Widget> _buildPages() {
    final List<Widget> pages = <Widget>[];
    for (int index = 0; index < 10; index++) {
      var alignment = Alignment.center.add(new Alignment(
          (selectedIndex.value - index) * _kViewportFraction, 0.0));
      var resizeFactor = (1 -
          (((selectedIndex.value - index).abs() * 0.2).clamp(0.0, 1.0)));
      pages.add(
          _contentWidget(
            Menu.menu[index],
            alignment,
            resizeFactor,
          )
      );
    }
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return new Stack(
      children: <Widget>[
        new Positioned.fill(bottom: screenHeight / 2,
            child: new Container(
                decoration: new BoxDecoration(color: _backColor))),
        new CustomAppBar(),
        new Align(alignment: Alignment.bottomCenter,
            child: new Padding(padding: const EdgeInsets.only(bottom: 50.0),
                child: new RectangleIndicator(
                    _backgroundPageController, Menu.menu.length, 6.0, Colors.grey[400],
                    Colors.black))),
        new PageView.builder(
          itemCount: Menu.menu.length,
          itemBuilder: (BuildContext context, int itemCount){
            return Container();
          },
          controller: _backgroundPageController,
          onPageChanged: (index) {
            setState(() {
              _backColor =
              colors[new math.Random().nextInt(colors.length)];
            });
          },
        ),
        new NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification.depth == 0 &&
                notification is ScrollUpdateNotification) {
              selectedIndex.value = _pageController.page;
              if (_backgroundPageController.page != _pageController.page) {
                _backgroundPageController.position
                    // ignore: deprecated_member_use
                    .jumpToWithoutSettling(_pageController.position.pixels /
                    _kViewportFraction);
              }
              setState(() {});
            }
            return false;
          },
          child: new PageView(
            controller: _pageController,
            children:_buildPages(),
          ),
        ),
        new Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 35.5,left: 10.0, right: 10.0, bottom: 180.0),
          child: new StaggerAnimation(controller: controller.view),
        )
      ],
    );
  }
}
