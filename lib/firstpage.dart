import 'package:flutter/material.dart';
//import 'mywebsite.dart';
import 'home.dart';
import 'dart:io';
//import 'demo.dart';
//import 'my_location.dart';
//import 'my_url.dart';
//void main() {
//runApp(MaterialApp(
//  title: 'smokong and no mask_thief2021 Detetcion',
//  home: FirstRoute(),
// debugShowCheckedModeBanner: false,
//));
//}

class FirstRoute extends StatefulWidget {
  //const FirstRoute({ Key? key }) : super(key: key);

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  // Icon fab = Icon(
  //  Icons.refresh,
  //);

  // int fabIconNumber = 0;
  // int _currentIndex = 0;
  // final tabs = [
  //  Center(child: Text('Search')),
  //  Center(child: Text('Search')),
  //  Center(child: Text('Search')),
//Center(Text('Search'),)
  // ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
//body:TabBarView(
        //children: <Widget>[
        //WidgetA(),
        //WidgetB(),
        //WidgetC(),
        //],
//),

        backgroundColor: Colors.white, //(0xff8ffFFF),
        //  backgroundColor: Colors.greenAccent[200],
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.purple, Colors.orange])),
          ),
          //  bottom: TabBar(tabs: const <Widget>[
          // Tab(icon: Icon(Icons.looks_one), child: Text('Show A')),
          // Tab(icon: Icon(Icons.looks_two), child: Text('Show B')),
          // Tab(icon: Icon(Icons.looks_3), child: Text('Show C')),
          // ]),
          title: new Text(
            'The Accidents Detection ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
//Text('mask_thief2021 and No mask_thief2021 Person Detection '),

          actions: <Widget>[
            IconButton(
              //icon: Icon(Icons.exit_to_app),
              icon: new Image.asset('icons/exit.png'),
              tooltip: 'Exit',
              onPressed: () {
                exit(0);
                // _launchURLApp();
                //  Navigator.push(
                //   context,
                //        MaterialPageRoute(builder: (context) => WebViewExample()),
                //  );
              },
            ),
            IconButton(
              // icon: Icon(Icons.help_center),
              icon: new Image.asset('icons/help.png'),
              tooltip: 'info',
              onPressed: () {
                // exit(0);
                _showResultHelp('About App. ');
                //  Navigator.push(
                //  context,
                //   MaterialPageRoute(builder: (context) => TabBarDemo()),
                //  );

                // _launchURLApp();
                //  Navigator.push(
                //   context,
                //        MaterialPageRoute(builder: (context) => WebViewExample()),
                //  );
              },
            ), //IconButton
            //  IconButton(
            //   icon: Icon(Icons.email),
            //   tooltip: 'Send Photo Fire Base',
            //   onPressed: () {
            //    Navigator.push(
            //    context,
            //    MaterialPageRoute(builder: (context) => URL()),
            //   );
            // },
            // ),
          ],
          backgroundColor: Colors.purpleAccent,
          // elevation: 50.0,
          // leading: IconButton(
          //  icon: Icon(Icons.home_outlined),
          //  tooltip: 'Menu Icon',
          //  onPressed: () {
          //  Navigator.push(
          //  context,
          // MaterialPageRoute(builder: (context) => MyLocation()),
          // );
          // },
          // ),
          //IconButton
          // brightness: Brightness.dark,
          // titleSpacing: 10.0,
          centerTitle: true,
          toolbarHeight: 40,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10.00,
          // backgroundColor: Colors.greenAccent[400],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.purpleAccent,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: ElevatedButton(
            child: Container(
              // constraints: BoxConstraints.expand(),

              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                image: DecorationImage(
                  image: AssetImage("images/accident.png"),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(1.0),
                    spreadRadius: 20,
                    blurRadius: 7,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
        ),

        //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        //floatingActionButton: FloatingActionButton(
        //   elevation: 10.0,
        //child: Icon(Icons.add),
        //   child: Icon(Icons.navigate_next),
        //   backgroundColor: Colors.lightGreenAccent[400],

        // onPressed: () => setState(() {
        // if (fabIconNumber == 0) {
        //  fab = Icon(
        //    Icons.stop,
        // );
        //  fabIconNumber = 1;
        // } else {
        ////  fab = Icon(Icons.refresh);
        //fabIconNumber = 0;
        // }
        //}),
        //  onPressed: () {
        // action on button press
        //   Navigator.push(
        //    context,
        //    MaterialPageRoute(builder: (context) => Home()),
        //  );
        // }),

        // drawer: Drawer(
        //   child: ListView(
        // children: const <Widget>[
        //  DrawerHeader(
        //  decoration: BoxDecoration(
        //    color: Colors.green,
        //  ),
        // child: Text(
        //    'Setting',
        //   style: TextStyle(
        // color: Colors.green,
        //    fontSize: 24,
        //   ),
        //  ),
        // ),
        // ListTile(
        //  title: Text('Item 1'),
        //  leading: Icon(Icons.people),
        //  ),
        //  ListTile(
        //   title: Text('Item 2'),
        //  leading: Icon(Icons.people),
        //   ),
        //  ],
        // ),
        // ),
        //   bottomNavigationBar: BottomNavigationBar(
        //  backgroundColor: Colors.blue,
        // type: BottomNavigationBarType.fixed,
        //  backgroundColor: Colors.black,
        // iconSize: 30,
        // selectedFontSize: 30,
        //  unselectedFontSize: 20,
        //  currentIndex: _currentIndex,
        //  fixedColor: Colors.green,
        // items: [
        // BottomNavigationBarItem(
        // ignore: deprecated_member_use
        //  title: Text("Home"),
        //  backgroundColor: Colors.yellow,
        //   icon: Icon(Icons.home),
        //  backgroundColor: Colors.yellow,
        // ),
        // BottomNavigationBarItem(
        // ignore: deprecated_member_use
        //  title: Text("Search"),
        //  icon: Icon(Icons.search),
        //  backgroundColor: Colors.red,
        // ),
        // BottomNavigationBarItem(
        // ignore: deprecated_member_use
        // title: Text("Profile"),
        //  icon: Icon(Icons.account_circle),
        //  backgroundColor: Colors.blue,
        // ),
        //   ],
        // onTap: (index) {
        // setState(() {
        //   _currentIndex = index;
        //   print(index);
        // });
        //  }
        //  ),
      ),
    );
  }

  //
  void _showResultHelp(String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              text,
              //  textDirection: TextDirection.rtl,
            ),
            content: Scrollbar(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 50,
                shadowColor: Colors.greenAccent[100],
                color: Colors.greenAccent[100],
                child: SizedBox(
                  width: 350,
                  height: 600,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.greenAccent[100],
                          radius: 108,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("images/front.png"),
                            // NetworkImage(
                            // "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
                            // image: AssetImage("assets/images/bulb.jpg"),
                            radius: 100,
                          ), //CircleAvatar
                        ), //CirclAvatar
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          'The Accidents Detection ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.green[900],
                            fontWeight: FontWeight.w500,
                          ),
                          //  textDirection: TextDirection.rtl, //Textstyle
                        ), //Text
                        SizedBox(
                          height: 8,
                        ), //SizedBox
                        Text(
                          'this application to know The Accidents detection like fire ,flood,cars crash and dead person in the street and sharing location information of accidents with other mobile apps.by using machine learning technology in the field of artificial intelligence using the algorithms and Tensorflow framework',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ), //Textstyle
                        ), //Text
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          'By Falah.G.Saleih ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ), //Textstyle
                        ),
                        SizedBox(
                          width: 120,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirstRoute()),
                              );
                            }, //=> null,
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app),
                                  Text('Ok'),
                                ],
                              ), //Row
                            ), //Padding
                          ), //RaisedButton
                        ) //SizedBox
                      ],
                    ), //Column
                  ), //Padding
                ), //SizedBox
              ), //Card

              //  SingleChildScrollView(
              //  child: Text(text),
              // physics: BouncingScrollPhysics(
              //   parent: AlwaysScrollableScrollPhysics()),
            ),
            //),
            // actions: [
            // ignore: deprecated_member_use
            //FlatButton(
            // child: Text('Close'),
            // onPressed: () {
            // Navigator.of(context).pop();
            //// Navigator.push(
            //   context,
            //  MaterialPageRoute(builder: (context) => FirstRoute()),
            //  );
            // },
            //)
            // ],
          );
        });
  }
}

//my functions web site
//launchURLApp() async {
//  const url = 'https://iraqprogrammer.wordpress.com/';
//  if (await canLaunch(url)) {
//    await launch(url, forceSafariVC: true, forceWebView: true);
 // } else {
 //   throw 'Could not launch $url';
 // }
//}


// email
//_launchemail(String toMailId, String subject, String body) async {
 // var url = 'mailto:$toMailId?subject=$subject&body=$body';
 // if (await canLaunch(url)) {
  //  await launch(url);
 // } else {
   // throw 'Could not launch $url';
 // }
//}

