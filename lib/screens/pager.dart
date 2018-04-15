import 'dart:async';
import 'package:flutter/scheduler.dart' show timeDilation ;
import 'package:flutter/material.dart';
import 'package:menu/model/food.dart';
import 'package:menu/model/menu.dart';
import 'package:menu/widgets/cart_button.dart';
import 'package:menu/widgets/custom_app_bar.dart';
import 'package:menu/widgets/animated_circle.dart';
import 'package:menu/widgets/rectangle_indicator.dart';
import 'package:menu/widgets/food_image.dart';
import 'package:menu/widgets/item_card.dart';
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
  int _counter = 0;
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
      setState(() {_counter = 0;});
      if(controller.isCompleted){
        controller.reset();
        await controller.forward().orCancel;
      } else {
        await controller.forward().orCancel;
      }
    } on TickerCanceled {

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
                new ItemCard(
                    food: food,
                    increment: () {
                      setState(() {
                        _counter++;
                      });
                    },
                    decrement: () {
                      setState(() {
                        _counter--;
                      });
                    },
                    counter: _counter
                ),
                new FoodImage(food: food),
                new CartButton(counter: _counter, addToCart: (){playAnimation();})
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
        Positioned.fill(
          top: 35.0,
          right: 10.0,
          bottom: 100.0,
          child: new StaggerAnimation(controller: controller.view)
        ),
      ],
    );
  }
}
