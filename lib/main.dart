import 'package:flutter/material.dart';
import 'menu_icons.dart';

void main() => runApp(new MyHomePage(title: 'Menu'));

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _dicrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: new Scaffold(
          body: new Stack(
            children: <Widget>[
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new DecoratedBox(decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(30.0)),
                      child: new ClipRRect(
                        borderRadius: new BorderRadius.circular(50.0),
                        child: new MaterialButton(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          onPressed: null,
                          color: Colors.grey[900],
                          child: new Text('\$50', style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new IconButton(icon: new Icon(Icons.remove),
                            onPressed: _dicrementCounter),
                        new Text('$_counter', style: Theme
                            .of(context)
                            .textTheme
                            .title,),
                        new IconButton(icon: new Icon(Icons.add),
                            onPressed: _incrementCounter),
                      ],),
                    new MaterialButton(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      onPressed: null,
                      elevation: _counter == 0 ? 0.0 : 2.0,
                      color: _counter == 0 ? Colors.grey[350] : Colors
                          .amber[400],
                      child: new Icon(
                          const IconData(
                              0xe807,
                              fontFamily: 'fontello'), size: 25.0,
                          color: Colors.white),
                    ),

                  ],
                ),
              ),
              new MenuIcons(counter: _counter,),
            ],
          ),
        )
    );
  }
}

