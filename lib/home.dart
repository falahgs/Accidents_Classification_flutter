import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'firstpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
//import 'demo.dart';
//import 'my_location.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share/share.dart';
//import 'package:flutter/services.dart' show rootBundle;
//import 'dart:async';
//import 'read_txt.dart';

//import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //String label;
  Position _currentPosition;
  String _currentAddress;
  String msg;
  String msg1;
  String msgfinal;
  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker(); //allows us to pick image from gallery or camera
  String currentTtsString;
  double ttsSpeechRate1 = 0.5;
  double ttsSpeechRate2 = 1.0;
  double currentSpeechRate;

  //FlutterTts flutterTts;
  bool bolSpeaking = false;
  // read file text
  //String _data;

  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    //this function runs the model on the image
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 4, //the amout of categories our neural network can predict
      threshold: 0.1,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    // _getall();
    setState(() {
      //String _data;
      _output = output;

      /// String _filename;
      // _filename = _output[0]['label'];
      //   _data = _loadData(_output[0]['label']);
      print(_data);
      // startSound();
      //  print('falahgs3');
      // _output = output;
      print('output');
      print(_output);
      if (output.isEmpty) {
        print('empety');
        _showNot('The plant is not Known ');
      }
      print('falahgs4');
      print(_output[0]['label']);
      print(_output[0]['confidence']);

      //FirebaseFirestore.instance
      // .collection('datax')
      // .add({'name': _output[0]['labels']}); //data added through app'});
      FirebaseFirestore.instance.collection('data');
      CollectionReference data = FirebaseFirestore.instance.collection('data');
      // FirebaseFirestore.instance
      //   .collection('data')
      //  .add({'name': _output[0]['labels']}); //data added through app'});
      print('hi firebase');
      print(_output[0]['label']);
      data.add({
        'Name': _output[0]['label'],
        'Prob.': (_output[0]['confidence'] * 100).toStringAsFixed(2) + '%',
        'Time': DateTime.parse(DateTime.now().toLocal().toString()),
        // 'DateUTC': DateTime.now().toUtc(),
        // 'UpdatedDt': DateFormat("yy-MM-dd hh:mm:ss aaa").format(
        //  DateTime.parse(DateTime.now().toUtc().toString()).toLocal()),
        //'fiftyDaysAgo': DateTime.now().subtract(const Duration(days: 10)),
        //'Hour': DateTime.now().hour - 2,
        // 'Minute': DateTime.now().minute,
        //'Second': DateTime.now().second,
      });
      if (_output[0]['labels'] == 'Masked_Thief') {
        //    startSound();
      } else {
        print('no sound');
      }
      // _getall();
      // print('hello first');
      if (output.isEmpty) {
        print('empety');
        _showNot('The events is not Known ');
      }
      _loading = false;
    });
    // String _filename;
    //_filename = _output[0]['label'];
    _data = '';
  }

  loadModel() async {
    //this function loads our model
    await Tflite.loadModel(
        model: 'assets/model_events.tflite', labels: 'assets/labels.txt');
  }

  pickImage() async {
    //this function to grab the image from camera
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;
    // await FlutterExifRotation.rotateImage(path: image.path);
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    //  return Sizer(builder: (context, orientation, deviceType) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            //icon: Icon(Icons.exit_to_app),
            icon: new Image.asset('icons/exit.png'),
            tooltip: 'Exit',
            onPressed: () {
              exit(0);
            },
          ),
          //  IconButton(
          //   icon: Icon(Icons.book),
          //  icon: new Image.asset('icons/help.png'),
          //  tooltip: 'info',
          //  onPressed: () {
          //  _loadData(_output[0]['label']);
          //  },
          // ), //IconButton
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.purple, Colors.orange])),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white70,
        title: Text(
          'Upload Image Or Camera ',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 20,
              letterSpacing: 0.8),
        ),
      ),
      body: Container(
        // width: 20.w, //It will take a 20% of screen width
        //height: 30.h,
        // color: Colors.black.withOpacity(0.9),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.purpleAccent,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0x0FFC2CEA),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Center(
                    child: _loading == true
                        ? null //show nothing if no picture selected
                        : Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 250,
                                  width: 250,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.file(
                                      _image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                                // read texts file
                                Divider(
                                  height: 2,
                                  thickness: 1,
                                ),
                                //  if (_data != null)
                                //  Card(
                                //  elevation: 50,
                                // shadowColor: Colors.white,
                                //  color: Colors.white70,
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(30),
                                // ),
                                //  child: SizedBox(
                                //  width: 350,
                                // height: 100,
                                // child: Padding(
                                //   padding: const EdgeInsets.all(20.0),
                                //  child: Column(children: [
                                //  Text(
                                //   _data,
                                //  style: TextStyle(
                                //   color: Colors.black,
                                //   fontSize: 18,
                                //   fontWeight: FontWeight.w400),
                                //),
                                //  ]),
                                //  ),
                                //  ),
                                //  ),
                                SizedBox(
                                  width: 80,
                                ), //Column

                                Divider(
                                  height: 2,
                                  thickness: 2,
                                ),
                                if (_output[0]['confidence'] >= 0.25)
                                  Card(
                                    elevation: 50,
                                    shadowColor: Colors.white,
                                    color: Colors.white70,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SizedBox(
                                      width: 350,
                                      height: 160,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'The accident is : ${_output[0]['label']}\n    Prob.              : ${(_output[0]['confidence'] * 100).toStringAsFixed(2) + '%'}\n ' // +
                                              // (_data), //2- The tumor  is : ${_output[1]['label']}\n    Prob.                       : ${(_output[1]['confidence'] * 100).toStringAsFixed(2) + '%'}\n ',
                                              ,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),

                                            SizedBox(
                                              width: 80,
                                            ) //SizedBox
                                          ],
                                        ), //Column
                                      ), //Padding
                                    ), //SizedBox
                                  )
                                else
                                  Card(
                                    elevation: 50,
                                    shadowColor: Colors.green,
                                    color: Colors.greenAccent[100],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SizedBox(
                                      width: 350,
                                      height: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              ' The accident name is  not found',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                              // style: TextStyle(
                                              //   fontSize: 15,
                                              //  color: Colors.green[900],
                                              // ), //Textstyle
                                            ), //Text
                                            // SizedBox(
                                            //   height: 10,
                                            //  ), //SizedBox
                                            SizedBox(
                                              width: 80,
                                            ) //SizedBox
                                          ],
                                        ), //Column
                                      ), //Padding
                                    ), //SizedBox
                                  )

                                //Container(),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    GestureDetector(
                      onTap: pickImage,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.purpleAccent[400],
                              borderRadius: BorderRadius.circular(15)),
                          //  child: Text(
                          //  'Take A Photo',
                          //  style: TextStyle(color: Colors.white, fontSize: 12),
                          //   ),
                          child: new Image.asset('icons/camera.png')
                          //Icon(
                          //Icons.camera_alt,
                          // size: 40,
                          ),
                    ),
                    //child: Icon(Icons.camera), //Text(
                    //  'Take A Photo',
                    //  style: TextStyle(color: Colors.white, fontSize: 12),
                    // ),
                    //   ),
                    //  ),
                    SizedBox(
                      height: 1,
                    ),
                    GestureDetector(
                      onTap: pickGalleryImage,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.purpleAccent[400],
                              borderRadius: BorderRadius.circular(15)),
                          child: new Image.asset('icons/gallery.png')

                          //Icon(Icons.image),
                          //color: Colors.white, //
                          //  Text( 'Pick From Gallery', style: TextStyle(color: Colors.white, fontSize: 12),),
                          //  Icon(
                          //  Icons.photo_album,
                          //   size: 40,
                          ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      //onTap: load location page and sharing ,
                      onTap: () {
                        _getCurrentLocation();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.purpleAccent[400],
                            borderRadius: BorderRadius.circular(15)),
                        child: FittedBox(
                          child: //Icon(Icons.image),
                              //color: Colors.white, //
                              //  Text( 'Pick From Gallery', style: TextStyle(color: Colors.white, fontSize: 12),),
                              Icon(
                            Icons.share,
                            size: 40,
                          ),
                        ),
                      ),
                    ),

                    // read text file

                    // GestureDetector(
                    //onTap: load location page and sharing ,
                    //  onTap: () {
                    //  Navigator.push(
                    //  context,
                    //MaterialPageRoute(builder: (context) => ReadTxt()),
                    //);

                    //    _showFile();
                    // },
                    // child: Container(
                    //  width: MediaQuery.of(context).size.width,
                    // alignment: Alignment.center,
                    // padding:
                    //   EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    //  decoration: BoxDecoration(
                    // color: Colors.purpleAccent[400],
                    //   borderRadius: BorderRadius.circular(15)),
                    //  child: FittedBox(
                    // child: //Icon(Icons.image),
                    //color: Colors.white, //
                    //  Text( 'Pick From Gallery', style: TextStyle(color: Colors.white, fontSize: 12),),
                    //  Icon(
                    //  Icons.share,
                    //  size: 40,
                    //  ),
                    // ),
                    // ),
                    // ),
                    //// SizedBox(
                    //   height: 3,
                    // ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // });
  }

//
  void _showNot(String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'معلومة عن النبتة ',
              //  textDirection: TextDirection.rtl,
            ),
            content: Scrollbar(
              child: Card(
                elevation: 50,
                shadowColor: Colors.greenAccent[100],
                color: Colors.greenAccent[100],
                child: SizedBox(
                  width: 300,
                  height: 500,
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
                          ' لاتوجد بيانات عن هذا النبات  ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.green[900],
                            fontWeight: FontWeight.w500,
                          ),
                          //  textDirection: TextDirection.rtl, //Textstyle
                        ), //Text

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
            ),
          );
        });
  }

  //load geo location

  _getCurrentLocation() {
    // String labels;
    // labels = widget.label;
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
        share(context, _currentPosition);
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  share(BuildContext context, Position _currentPosition) {
    final RenderBox box = context.findRenderObject();
    String _msg = 'The Accident and Location type detection ';
    String _labels;
    // _labels = widget.label;
    _labels = _output[0]['label'];
    print(_currentAddress);
    Share.share(
        "The Latitude : '${_currentPosition.latitude} \n The Longitude : ${_currentPosition.longitude} \n The Date :${_currentPosition.timestamp} \n  The Address : $_currentAddress   \n The Accident  : $_labels'",
        subject: _msg, //_currentPosition.timestamp.timeZoneName,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  // load data text file

  String _data;

  // This function is triggered when the user presses the floating button
  ////_loadData(String _filename) async {
  // final _loadedData =
  //  await rootBundle.loadString('texts/$_filename' + '.txt');
  // setState(() {
  // _data = _loadedData;
  //  print(_data);
  //  });
  //}
}
