import 'package:flutter/material.dart';
import 'package:menu/model/food.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({this.food});
  final Food food;
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(top: 50.0, bottom: 30.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(food.name, style: const TextStyle(fontSize: 21.0, fontWeight: FontWeight.w400, fontFamily: 'Dosis')),
          DecoratedBox(decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0)),
              child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: MaterialButton(
                minWidth: 70.0,
                onPressed: null,
                color: Colors.grey[900],
                child: Text(food.price, style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      print('decrement');
                    }
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[700],
                      width: 0.5,
                    ),
                  ),
                  child: SizedBox(
                    width: 70.0,
                    height: 45.0,
                    child: Center(
                        child: Text('$_counter', style: Theme
                            .of(context)
                            .textTheme
                            .subhead, textAlign: TextAlign.center)
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.add),
                    onPressed: (){
                      print('increment');
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
