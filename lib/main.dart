//========================================================================================
// Flutter
//========================================================================================
// Default Material
import 'package:flutter/material.dart';
// Locale
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Location
import 'package:location/location.dart';
import 'package:package_info_plus/package_info_plus.dart';
// Shared Preferences
import 'package:shared_preferences/shared_preferences.dart';
//========================================================================================

//========================================================================================
// Our Files
//========================================================================================
// API
import 'package:weather/api/api.dart';
// Models
import 'package:weather/models/weather.dart';
// Views
import 'package:weather/views/splash.dart';
import 'package:weather/views/second_route.dart';
import 'package:weather/views/third_route.dart';
import 'package:weather/views/fourth_route.dart';
// Tools
import 'package:weather/tools/tools.dart';
//========================================================================================

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const Splash(),
        '/second': (context) => SecondRoute(),
        '/third': (context) => ThirdRoute(),
        '/fourth': (context) => FourthRoute()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

late SharedPreferences prefs;

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<String> initPlatformState() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    prefs = await SharedPreferences.getInstance();

    if(prefs.getString('version') != version)
    {
      prefs.setString('date', DateTime.now().toString());
      prefs.setString('version', version);
    }

    return version;
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeatherApp'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
          children: <Widget>[
          RaisedButton(
            child: Text('Weather for Location'),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
          RaisedButton(
            child: Text('Weather for Coimbra'),
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
          ),
          RaisedButton(
            child: Text('Not working'),
            onPressed: () {
              Navigator.pushNamed(context, '/fourth');
            },
          ),
          FutureBuilder<String>(
            future: initPlatformState(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Text('Last update ${prefs.getString("date")}');
              },
            ),
          ],
      )),
    );
  }
}
