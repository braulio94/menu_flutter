import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top,
          right: 5.0,
      ),
      child: Row(
        children: [
          Expanded(flex: 3,child: Row(
            children: <Widget>[
              IconButton(
                tooltip: 'Menu Icon',
                icon:  Icon(
                    const IconData(
                        0xe802,
                        fontFamily: 'fontello'),size: 18.0, color: Colors.black87),
                onPressed: null,
              ),
              Expanded(
                child: Text(
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
          IconButton(
            tooltip: 'Shopping Cart',
            icon: Icon(const IconData(0xe807, fontFamily: 'fontello'),
                color: Colors.black87),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
