import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SecondRoute extends StatelessWidget {

  Location location = Location();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Click Me Page"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                  stream: location.onLocationChanged,
                  builder: (context, snapshot){
                    if(snapshot.connectionState != ConnectionState.waiting)
                    {
                      var data = snapshot.data as LocationData;

                      return Text('Position:  ${data.latitude}/${data.longitude}');
                    }
                    else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }
              ),
              RaisedButton(
                  onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Back')),
            ]
        ),
      ),
    );
  }
}
