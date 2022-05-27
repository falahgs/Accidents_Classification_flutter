import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'firstpage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(new MaterialApp(
    //color: Color.fromRGBO(255, 255, 222, 11),
    home: new MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new FirstRoute(),
        title: new Text('Welcome for The Accidents Detection  App. ',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        image: new Image.asset('images/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        loaderColor: Colors.red);

    // image: new Image.network(
    //'https://flutter.io/images/catalog-widget-placeholder.png'),
    //   image: new Image.asset('images/logo.png'),
    //  backgroundColor: Colors.greenAccent[400],
    //  loaderColor: Colors.red,
    //  );
  }
}
