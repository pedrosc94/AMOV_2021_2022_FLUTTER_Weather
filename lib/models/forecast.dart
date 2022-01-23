import 'dart:convert';

class Forecast {
  Forecast({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.daily,
  });

  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  List<Daily> daily;

  factory Forecast.fromJson(String str) => Forecast.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Forecast.fromMap(Map<String, dynamic> json) => Forecast(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "daily": List<dynamic>.from(daily.map((x) => x.toMap())),
      };
}

class Daily {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
    required this.rain,
  });

  int dt;
  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moonPhase;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  double windGust;
  List<WeatherElement> weather;
  int clouds;
  double pop;
  double uvi;
  double rain;

  factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Daily.fromMap(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"].toDouble(),
        temp: Temp.fromMap(json["temp"]),
        feelsLike: FeelsLike.fromMap(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather: List<WeatherElement>.from(
            json["weather"].map((x) => WeatherElement.fromMap(x))),
        clouds: json["clouds"],
        pop: json["pop"].toDouble(),
        uvi: json["uvi"].toDouble(),
        rain: json["rain"] == null ? null : json["rain"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp.toMap(),
        "feels_like": feelsLike.toMap(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
        "rain": rain == null ? null : rain,
      };
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  double day;
  double night;
  double eve;
  double morn;

  factory FeelsLike.fromJson(String str) => FeelsLike.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Temp.fromMap(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class WeatherElement {
  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory WeatherElement.fromJson(String str) =>
      WeatherElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherElement.fromMap(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
