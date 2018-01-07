import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  CustomAppBar({Key key, this.counter}) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top,
          right: 5.0,
      ),
      child: new Row(
        children: [
          new Expanded(flex: 3,child: new Row(
            children: <Widget>[
              new IconButton(
                tooltip: 'Menu Icon',
                icon: new  Icon(
                    const IconData(
                        0xe802,
                        fontFamily: 'fontello'),size: 18.0, color: Colors.grey[700]),
                onPressed: null,
              ),
              new Container(
                margin: const EdgeInsets.only(
                  left: 16.0
                ),
                child: new Text(
                    'Menu',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.title),
              ),
            ],
          ),
          ),
          new Stack(
            children: <Widget>[
              new IconButton(
                tooltip: 'Shopping Cart',
                icon: new Icon(const IconData(0xe807, fontFamily: 'fontello'),
                    color: Colors.grey[700]),
                onPressed: null,
              ),
              new Container(
                height: 20.0,
                width: 20.0,
                alignment: new FractionalOffset(1.0, 0.5),
                //margin: const EdgeInsets.only(left:25.0, top: 5.0),
                child: new CircleAvatar(
                  child: new Text('$counter', textDirection: TextDirection.ltr, style: const TextStyle(color: Colors.white, fontSize: 12.0)),
                  backgroundColor: Colors.amber[400],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
