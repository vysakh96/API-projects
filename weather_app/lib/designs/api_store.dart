class Store {
  String time;
  String conditions;
  double temp_c;
  double lat;
  double lon;
  double feels;
  double temp_f;
  int humidity;
  double wind;
  double visibility;
  double pressure;
  Store(
      {this.time = '2023-02-01 12.30',
      this.conditions = 'Clear',
      this.temp_c = 8,
      this.lat = 51.52,
      this.lon = -0.11,
      this.feels = 5.5,
      this.temp_f = 46.4,
      this.humidity = 76,
      this.wind = 20.2,
      this.visibility = 10.0,
      this.pressure = 1026.0});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      time: json["location"]["localtime"],
      conditions: json["current"]["condition"]["text"],
      temp_c: json["current"]["temp_c"],
      lat: json["location"]["lat"],
      lon: json["location"]["lon"],
      feels: json["current"]["feelslike_c"],
      temp_f: json["current"]["temp_f"],
      humidity: json["current"]["humidity"],
      wind: json["current"]["wind_kph"],
      visibility: json["current"]["vis_km"],
      pressure: json["current"]["pressure_mb"],
    );
  }
}
