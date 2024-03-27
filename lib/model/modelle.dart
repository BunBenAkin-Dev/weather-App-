class weathddd {
  location Location;
  current Current;

  weathddd({required this.Location, required this.Current});

  factory weathddd.fromJson(Map<String, dynamic> json) {
    return weathddd(
        Location: location.fromJson(json['location']),
        Current: current.fromJson(
          json['current'],
        ));
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

//localtime_epoch