import 'package:flutter/material.dart';
import 'package:weather/main.dart';

class Splash extends StatefulWidget{
  const Splash ({Key? key}):super(key:key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>
{
  @override
  void initState(){

    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'App Flutter',)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2194f2),
      body: Center(

        child: Container(
          child: const Text(
              'Weather App Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
          ),
        ),
      ),
    );
  }
}