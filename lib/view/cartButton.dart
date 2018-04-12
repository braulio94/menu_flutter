import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  final int counter;


  CartButton(this.counter);

  @override
  _CartButtonState createState() => new _CartButtonState(counter);
}

class _CartButtonState extends State<CartButton> {
  int counter;
  _CartButtonState(this.counter);


  @override
  void initState() {
    super.initState();
    counter = 1;
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: 70.0,
      height: 50.0,
      child: new MaterialButton(
        highlightColor: Colors.grey[900],
        onPressed: (){
          setState((){
            counter = 0;
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
    );
  }
}