import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/component/hourryepoch.dart';
import 'package:weather/model/modelle.dart';

class Forecastcustom extends StatelessWidget {
  Forecastcustom(
      {required this.newcolor, required this.hourlydetails, super.key});

  Color newcolor;
  List<hour> hourlydetails;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: newcolor,
            borderRadius: BorderRadius.all(Radius.circular(7))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(
            children: [
              Expanded(
                  child: Text(
                'Hourly Forecast',
                style: TextStyle(color: Colors.white),
              )),
              Text(
                '72 Hours',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Divider(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var hourry in hourlydetails)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        epoch(
                          epochy: hourry.localepoch,
                        ),
                        Image.network(
                          'https:${hourry.Condition.icon}',
                          width: 30,
                          height: 30,
                        ),
                        Text(
                          '${hourry.tempc.toInt()} \u00B0',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          )
        ]));
  }
}
