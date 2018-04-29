import 'package:flutter/material.dart';

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
            end: 20.0,
            begin: 60.0
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 1.0, curve: Curves.ease))),

        dy = new Tween<double>(
            end: 20.0,
            begin: 60.0
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 1.0, curve: Curves.ease))),

        alignment = new AlignmentTween(
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 1.0, curve: Curves.ease))),

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
