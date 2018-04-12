import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation ;

class AnimatedCircle extends StatefulWidget {

  final int counter;
  var alignment;
  final GestureTapCallback onTap;

  AnimatedCircle(this.counter, this.alignment, this.onTap);

  @override
  _AnimatedCircleState createState() => _AnimatedCircleState(counter, alignment, onTap);
}

class _AnimatedCircleState extends State<AnimatedCircle> with TickerProviderStateMixin{

  AnimationController _controller;
  int counter;
  var alignment;
  final GestureTapCallback onTap;

  _AnimatedCircleState(this.counter, this.alignment, this.onTap);


  @override
  void initState() {
    super.initState();
    counter = 1;
    _controller =  AnimationController(
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
    return  Container(
      alignment: alignment,
      margin: const EdgeInsets.only(top: 35.5, right: 10.0, bottom: 120.0),
      child:  StaggerAnimation(controller: _controller.view),
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

        opacity =  Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate( CurvedAnimation(parent: controller, curve:  Interval(0.0, 0.200, curve: Curves.ease))),

        dx =  Tween<double>(
            end: 15.0,
            begin: 70.0
        ).animate( CurvedAnimation(parent: controller, curve:  Interval(0.0, 0.500, curve: Curves.ease))),

        dy =  Tween<double>(
            end: 15.0,
            begin: 70.0
        ).animate( CurvedAnimation(parent: controller, curve:  Interval(0.0, 0.500, curve: Curves.ease))),

        alignment =  AlignmentTween(
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
        ).animate( CurvedAnimation(parent: controller, curve:  Interval(0.0, 0.500, curve: Curves.ease))),

        super(key: key);

  Widget _buildAnimation(BuildContext context, Widget child){
    return  Container(
        alignment: alignment.value,
        child:  Opacity(
          opacity: opacity.value,
          child:  Container(
            width: dx.value,
            height: dy.value,
            decoration:  BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          ),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
