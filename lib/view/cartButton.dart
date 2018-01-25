import 'package:flutter/material.dart';

class CartButton extends StatelessWidget{
  const CartButton(this.counter);
  final int counter;

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 120.0),
      child: new SizedBox(
        width: 70.0,
        height: 50.0,
        child: new Hero(tag: 'cart_items',
          child: new MaterialButton(
            highlightColor: Colors.grey[900],
            onPressed: null,
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
    );
  }
}