import 'package:flutter/material.dart';
import 'package:menu/model/food.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({this.food});
  final Food food;
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return new Container(
    margin: const EdgeInsets.only(top: 100.0, bottom: 35.0),
    child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Text(food.name, style: Theme.of(context).textTheme.headline),
          new DecoratedBox(decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(30.0)),
              child: new ClipRRect(
              borderRadius: new BorderRadius.circular(50.0),
              child: new MaterialButton(
                minWidth: 70.0,
                onPressed: null,
                color: Colors.grey[900],
                child: new Text(food.price, style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(icon: new Icon(Icons.remove),
                    onPressed: null),
                new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(
                      color: Colors.grey[700],
                      width: 0.5,
                    ),
                  ),
                  child: new SizedBox(
                    width: 70.0,
                    height: 45.0,
                    child: new Center(
                        child: new Text('$_counter', style: Theme
                            .of(context)
                            .textTheme
                            .subhead, textAlign: TextAlign.center)
                    ),
                  ),
                ),
                new IconButton(icon: new Icon(Icons.add),
                    onPressed: null),
              ],
            ),
          )
        ],
      ),
    );
  }
}
