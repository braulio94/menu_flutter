import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

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
                        fontFamily: 'fontello'),size: 18.0, color: Colors.black87),
                onPressed: null,
              ),
              new Expanded(
                child: new Text(
                    'MENU',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 21.0,
                        fontFamily: 'Dosis',
                        fontWeight: FontWeight.w600
                    )),
              ),
            ],
          ),
          ),
          new IconButton(
            tooltip: 'Shopping Cart',
            icon: new Icon(const IconData(0xe807, fontFamily: 'fontello'),
                color: Colors.black87),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
