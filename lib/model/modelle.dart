class weathddd {
  location Location;
  current Current;
  forecast Forecst;

  weathddd(
      {required this.Location, required this.Current, required this.Forecst});

  factory weathddd.fromJson(Map<String, dynamic> json) {
    return weathddd(
        Location: location.fromJson(json['location']),
        Current: current.fromJson(
          json['current'],
        ),
        Forecst: forecast.fromjson(json['forecast']));
  }
}

class current {
  double tempc;
  double tempf;
  double windmph;
  double windkph;
  int winddegree;
  String windirection;
  int humidity;
  int cloud;
  double feelslike;
  condition Condition;
  double precip;
  double viskm;
  current(
      {required this.viskm,
      required this.tempc,
      required this.feelslike,
      required this.Condition,
      required this.tempf,
      required this.winddegree,
      required this.cloud,
      required this.humidity,
      required this.windirection,
      required this.windkph,
      required this.precip,
      required this.windmph});

  factory current.fromJson(Map<String, dynamic> json) {
    return current(
        tempc: json['temp_c'],
        tempf: json['temp_f'],
        winddegree: json['wind_degree'],
        cloud: json['cloud'],
        humidity: json['humidity'],
        windirection: json['wind_dir'],
        windkph: json['wind_kph'],
        windmph: json['wind_mph'],
        feelslike: json['feelslike_c'],
        precip: json['precip_in'],
        viskm: json['vis_km'],
        Condition: condition.fromJson(json['condition']));
  }
}

class condition {
  String text;
  String icon;

  condition({required this.text, required this.icon});

  factory condition.fromJson(Map<String, dynamic> json) {
    return condition(
      text: json['text'],
      icon: json['icon'],
    );
  }
}

class location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  int localtimeepoch;

  location(
      {required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.localtimeepoch,
      required this.lon});

  factory location.fromJson(Map<String, dynamic> json) {
    return location(
        name: json['name'],
        region: json['region'],
        country: json['country'],
        lat: json['lat'],
        localtimeepoch: json['localtime_epoch'],
        lon: json['lon']);
  }
}

class forecast {
  List<forecastday> ForecastDay;
  forecast({required this.ForecastDay});

  factory forecast.fromjson(Map<String, dynamic> json) {
    var forp = json['forecastday'] as List;
    List<forecastday> Forecstdayy =
        forp.map((e) => forecastday.fomjson(e)).toList();
    return forecast(ForecastDay: Forecstdayy);
  }
}

class forecastday {
  //day Day;
  List<hour> Hour;

  forecastday(
      {
      //required this.Day,
      required this.Hour});

  factory forecastday.fomjson(Map<String, dynamic> json) {
    var Hol = json['hour'] as List;
    List<hour> Hourp = Hol.map((e) => hour.fromjson(e)).toList();
    return forecastday(

        //Day: day.fromjson(json['day']),
        Hour: Hourp);
  }
}

class hour {
  int localepoch;
  double tempc;
  condition Condition;
  double feelslike;
  double wingustmph;
  double windmph;
  String winddirection;

  hour(
      {required this.localepoch,
      required this.tempc,
      required this.Condition,
      required this.feelslike,
      required this.winddirection,
      required this.windmph,
      required this.wingustmph});

  factory hour.fromjson(Map<String, dynamic> json) {
    return hour(
        localepoch: json['time_epoch'],
        tempc: json['temp_c'],
        Condition: condition.fromJson(json['condition']),
        feelslike: json['feelslike_c'],
        winddirection: json['wind_dir'],
        windmph: json['wind_mph'],
        wingustmph: json['gust_mph']);
  }
}
//localtime_epoch