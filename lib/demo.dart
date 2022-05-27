import 'package:flutter/material.dart';
import 'package:mask_thief_detetcion/main.dart';
import 'package:splashscreen/splashscreen.dart';
import 'firstpage.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key key}) : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: MaterialApp(
        home: Scaffold(
          bottomNavigationBar: Material(
            color: Theme.of(context).colorScheme.primary,
            child: TabBar(tabs: const <Widget>[
              Tab(icon: Icon(Icons.looks_one), child: Text('Show A')),
              Tab(icon: Icon(Icons.looks_two), child: Text('Show B')),
              Tab(icon: Icon(Icons.looks_3), child: Text('Show C')),
              Tab(icon: Icon(Icons.looks_one), child: Text('Show A')),
            ]),
          ),
          appBar: AppBar(
            bottom: TabBar(
              onTap: (index) {
                // Tab index when user select it, it start from zero
                print(index);
              },
              tabs: [
                Tab(icon: Icon(Icons.card_travel)),
                Tab(icon: Icon(Icons.add_shopping_cart)),
                Tab(icon: Icon(Icons.add_shopping_cart)),
                Tab(icon: Icon(Icons.add_shopping_cart)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: new TabBarView(
            children: <Widget>[
              Container(
                color: Colors.deepOrangeAccent,
                child: new Center(
                  child: new Text(
                    "Cake",
                    style: TextStyle(),
                  ),
                ),
              ),
              Container(
                color: Colors.deepOrangeAccent,
                child: new Center(
                  child: MyApp(), //new Text(  "Apple", style: TextStyle(), ),
                ),
                // child:MyApp(),
              ),
              Container(
                color: Colors.deepOrangeAccent,
                child: new Center(
                  child: new Text(
                    "Baskuit",
                    style: TextStyle(),
                  ),
                ),
              ),
              Container(
                color: Colors.deepOrangeAccent,
                child: new Center(
                  child: new Text(
                    "Cars",
                    style: TextStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new FirstRoute(),
        title: new Text('Welcome for Lung Cancer Detection App. ',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        image: new Image.asset('images/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);

    // image: new Image.network(
    //'https://flutter.io/images/catalog-widget-placeholder.png'),
    //   image: new Image.asset('images/logo.png'),
    //  backgroundColor: Colors.greenAccent[400],
    //  loaderColor: Colors.red,
    //  );
  }
}
