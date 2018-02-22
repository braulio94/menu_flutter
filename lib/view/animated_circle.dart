import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation ;
import 'package:menu/view/cartButton.dart';

class AnimatedCircle extends StatefulWidget {

  final int counter;

  AnimatedCircle(this.counter);

  @override
  _AnimatedCircleState createState() => new _AnimatedCircleState(counter);
}

class _AnimatedCircleState extends State<AnimatedCircle> with TickerProviderStateMixin{

  AnimationController _controller;
  int counter;
  _AnimatedCircleState(this.counter);

  @override
  void initState() {
    super.initState();
    counter = 1;
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 700),
        vsync: this
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled{

    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new Container(
      margin: const EdgeInsets.only(top: 35.5, right: 10.0, bottom: 120.0),
      child: new Stack(
        children: <Widget>[
          new StaggerAnimation(
            controller: _controller.view,
          ),
          new Align(
            alignment: FractionalOffset.bottomCenter,
            child: new Container(
              color: Colors.blue,
              child: new SizedBox(
                width: 70.0,
                height: 50.0,
                child: new MaterialButton(
                  highlightColor: Colors.grey[400],
                  onPressed: () {
                    setState(() {
                      counter = 0;
                      _playAnimation();
                    });
                  },
                  elevation: counter == 0 ? 10.0 : 5.0,
                  color: counter == 0 ? Colors.grey[350] : Colors.amber,
                  child: new Icon(
                      const IconData(
                          0xe807,
                          fontFamily: 'fontello'), size: 20.0,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> dx;
  final Animation<double> dy;
  final Animation<Alignment> alignment;

  StaggerAnimation({Key key, this.controller}):

        opacity = new Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 0.200, curve: Curves.ease))),

        dx = new Tween<double>(
            end: 15.0,
            begin: 70.0
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 0.500, curve: Curves.ease))),

        dy = new Tween<double>(
            end: 15.0,
            begin: 70.0
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 0.500, curve: Curves.ease))),

        alignment = new AlignmentTween(
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 0.500, curve: Curves.ease))),

        super(key: key);

  Widget _buildAnimation(BuildContext context, Widget child){
    return new Container(
        alignment: alignment.value,
        child: new Opacity(
          opacity: opacity.value,
          child: new Container(
            width: dx.value,
            height: dy.value,
            decoration: new BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          ),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
