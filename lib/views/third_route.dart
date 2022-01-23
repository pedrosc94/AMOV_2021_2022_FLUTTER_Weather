import 'package:flutter/material.dart';
import 'package:weather/api/api.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/tools/tools.dart';

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON HERE"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: getWeatherByName("Coimbra"),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else if (snapshot.hasData) {
              Weather w = Weather.fromMap(snapshot.data!);
              print(getUTC(1642960800));
              return Text(snapshot.data.toString());
              //return Text("API Request was Sucessfull!");
            } else
              return CircularProgressIndicator();
          }),
    );
  }
}
