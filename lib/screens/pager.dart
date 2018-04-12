import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:menu/routes.dart';
import 'package:menu/model/food.dart';
import 'package:menu/model/menu.dart';
import 'package:menu/widgets/custom_app_bar.dart';
import 'package:menu/widgets/animated_circle.dart';
import 'package:menu/widgets/rectangle_indicator.dart';
import 'package:menu/widgets/food_image.dart';
import 'package:menu/widgets/item_card.dart';
import 'package:menu/widgets/shadows.dart';
import 'dart:math' as math;

class MenuPager extends StatefulWidget {
  @override
  _MenuPagerState createState() => _MenuPagerState();
}

const double _kViewportFraction = 0.75;

class _MenuPagerState extends State<MenuPager> {

  final PageController _backgroundPageController = PageController(
      );
  final PageController _pageController = PageController(viewportFraction: _kViewportFraction);
  ValueNotifier<double> selectedIndex = ValueNotifier<double>(0.0);
  Color _backColor = const Color.fromRGBO(240, 232, 223, 1.0);
  final int _counter = 0;
  VoidCallback _callback;

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
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            alignment: alignment,
            width: 300.0 * resize,
            height: 400.0 * resize,
            child: Stack(
              children: <Widget>[
                shadow2,
                shadow1,
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Card(
                      elevation: 0.0,
                      child: Container(
                        height: math.min(300.0, MediaQuery
                            .of(context)
                            .size
                            .height),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () =>
                              Routes.navigateTo(
                                  context,
                                  '/detail/${food.id}',
                                  transition: TransitionType.fadeIn
                              ),
                          child: ItemCard(food: food),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: FractionalOffset.topCenter,
                    child: FoodImage(food: food),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    width: 70.0,
                    height: 50.0,
                    child: MaterialButton(
                      highlightColor: Colors.grey[400],
                      onPressed: _callback,
                      elevation: _counter == 0 ? 10.0 : 5.0,
                      color: _counter == 0 ? Colors.grey[350] : Colors.amber,
                      child: Icon(
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
      var alignment = Alignment.center.add(Alignment(
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
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Stack(
      children: <Widget>[
        Positioned.fill(bottom: screenHeight / 2,
            child: Container(
                decoration: BoxDecoration(color: _backColor))),
        CustomAppBar(),
        Align(alignment: Alignment.bottomCenter,
            child: Padding(padding: const EdgeInsets.only(bottom: 50.0),
                child: RectangleIndicator(
                    _backgroundPageController, Menu.menu.length, 6.0, Colors.grey[400],
                    Colors.black))),
        PageView.builder(
          itemCount: Menu.menu.length,
          itemBuilder: (BuildContext context, int itemCount){
            return Container();
          },
          controller: _backgroundPageController,
          onPageChanged: (index) {
            setState(() {
              _backColor =
              colors[math.Random().nextInt(colors.length)];
            });
          },
        ),
        NotificationListener<ScrollNotification>(
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
          child: PageView(
            controller: _pageController,
            children:_buildPages(),
          ),
        ),
        AnimatedCircle(_counter, Alignment.center, _callback),
      ],
    );
  }


}
