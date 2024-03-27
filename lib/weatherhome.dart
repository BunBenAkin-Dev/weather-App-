import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather/model/modelle.dart';

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
          windmph: 0));

  String ply = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataip();
  }

  Future<void> dataip() async {
    final response = await http.get(
        Uri.parse(
            'http://api.weatherapi.com/v1/current.json?key=c3a401aab7ad490180b04144242703&q=Chicago&aqi=no'),
        headers: {
          "Content-Type": "application/json",
        });

    if (response.statusCode == 200) {
      setState(() {
        final awl = json.decode(response.body);
        weatherData = weathddd.fromJson(awl);
      });
    } else {
      print('nonsense');
    }
  }

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: const Color.fromARGB(0, 45, 65, 75),
          // automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            children: [
              Center(
                  child: Image.network(
                'https:${weatherData.Current.Condition.icon}',
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Guck');
                },
              )),

              Center(
                child: Text(
                  '${weatherData.Current.tempc.toInt()}\u00B0',
                  style: const TextStyle(fontSize: 50, color: Colors.white),
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.amber,

                        border: Border.all(color: Colors.amber, width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    width: 110,
                    height: MediaQuery.of(context).size.height / 13,
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
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height / 13,
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
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height / 13,
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
              )
            ],
          ),
        ));
  }
}
