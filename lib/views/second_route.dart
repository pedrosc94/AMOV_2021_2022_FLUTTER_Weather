import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/api/api.dart';
import 'package:weather/models/weather.dart';

class SecondRoute extends StatelessWidget {
  Location location = Location();
  var resultLatitude;
  var resultLongitude;

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
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.waiting) {
                      var data = snapshot.data as LocationData;

                      resultLatitude = data.latitude.toString();
                      resultLongitude = data.longitude.toString();

                      return Text(
                          'Position:  ${data.latitude}/${data.longitude}');
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
              RaisedButton(
                  onPressed:  () async{
                    FutureBuilder<Map<String, dynamic>>(
                        future: getWeatherByCoords(resultLatitude, resultLongitude) ,
                        builder: (context, snapshot) {
                          if (snapshot.hasError)
                            return Text(snapshot.error.toString());
                          else if (snapshot.hasData) {
                            Weather w = Weather.fromMap(snapshot.data!);
                            print("Hello");
                            return Text(snapshot.data.toString());
                            //return Text("API Request was Sucessfull!");
                          } else
                            return CircularProgressIndicator();
                        });
                  },
                  child: Text('Back')),
            ]),
      ),
    );
  }
}
