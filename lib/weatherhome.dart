import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather/component/forecastcustom.dart';
import 'package:weather/model/modelle.dart';
import 'package:weather/search%20screeen.dart';

class Weatherhome extends StatefulWidget {
  const Weatherhome({super.key});

  @override
  State<Weatherhome> createState() => _WeatherhomeState();
}

class _WeatherhomeState extends State<Weatherhome> {
  String Key = 'c3a401aab7ad490180b04144242703';

  late weathddd weatherData = weathddd(
      Location: location(
          name: '', region: '', country: '', lat: 0, lon: 0, localtimeepoch: 0),
      Current: current(
          viskm: 0.0,
          precip: 0.0,
          feelslike: 0,
          tempc: 0,
          Condition: condition(text: '', icon: ''),
          tempf: 0,
          winddegree: 0,
          cloud: 0,
          humidity: 0,
          windirection: '',
          windkph: 0,
          windmph: 0),
      Forecst: forecast(ForecastDay: []));

  String ply = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataip();
  }

  List<forecastday> forcatsdetails = [];

  List<hour> hourlydetails = [];
  Future<void> dataip() async {
    final response = await http.get(
        Uri.parse(
            'http://api.weatherapi.com/v1/forecast.json?key=c3a401aab7ad490180b04144242703&q=Abuja&days=1&aqi=no&alerts=no'),
        headers: {
          "Content-Type": "application/json",
        });

    if (response.statusCode == 200) {
      setState(() {
        final awl = json.decode(response.body);
        weatherData = weathddd.fromJson(awl);
        hourlydetails =
            weatherData.Forecst.ForecastDay.expand((e) => e.Hour).toList();

        // hourlydetails = forcatsdetails.map((e) => ).toList()
      });
    } else {
      print('nonsense');
    }
  }

  @override
  Widget build(BuildContext context) {
    Color mycolor = Colors.black;

    double pacityleel = 0.5;

    Color newcolor = mycolor.withOpacity(pacityleel);

    DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(
        weatherData.Location.localtimeepoch * 1000);

    String formattime = DateFormat.Hm().format(timestamp);

    return Scaffold(
        drawer: const Drawer(
          child: Column(
            children: [],
          ),
        ),
        appBar: AppBar(
          foregroundColor: Colors.white,
          centerTitle: false,
          //leading: Icon(Icons.abc),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weatherData.Location.name,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                formattime,
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),

          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SearchScreen();
                  }));
                },
                icon: Icon(Icons.search))
          ],
          backgroundColor: const Color.fromARGB(0, 45, 65, 75),
          // automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.blueGrey,
        body: OrientationBuilder(builder: (context, orientation) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Center(
                        child: Image.network(
                      scale: 0.9,
                      'https:${weatherData.Current.Condition.icon}',
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Guck');
                      },
                    )),

                    Center(
                      child: Text(
                        '${weatherData.Current.tempc.toInt()}\u00B0',
                        style:
                            const TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    //RichText(text: TextSpan(children: ))

                    Text(
                      '${weatherData.Current.Condition.text} | ${'Feels like'} ${weatherData.Current.feelslike} \u00B0',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(text: 'Wind'),
                      const WidgetSpan(
                          child: SizedBox(
                        width: 5,
                      )),
                      TextSpan(text: '${weatherData.Current.windkph}'),
                      const WidgetSpan(
                          child: SizedBox(
                        width: 5,
                      )),
                      const TextSpan(text: 'km/h')
                    ])),

                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              // color: Colors.amber,

                              border: Border.all(color: Colors.amber, width: 3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          width:
                              orientation == Orientation.portrait ? 110 : 120,
                          height: orientation == Orientation.portrait ? 65 : 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.cloud,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    '${weatherData.Current.precip.toInt()} %',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Text(
                                'Precipitation',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              // color: Colors.amber,

                              border: Border.all(color: Colors.amber, width: 3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          width:
                              orientation == Orientation.portrait ? 110 : 120,
                          height: orientation == Orientation.portrait ? 65 : 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.water_drop,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    '${weatherData.Current.humidity.toInt()} %',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Text(
                                'Humidity',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              // color: Colors.amber,

                              border: Border.all(color: Colors.amber, width: 3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          width:
                              orientation == Orientation.portrait ? 110 : 120,
                          height: orientation == Orientation.portrait ? 65 : 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    '${weatherData.Current.viskm.toInt()} km',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Text(
                                'Visibility',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Forecastcustom(
                        newcolor: newcolor, hourlydetails: hourlydetails)
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
