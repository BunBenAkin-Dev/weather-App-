import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class epoch extends StatelessWidget {
  epoch({required this.epochy, super.key});

  int epochy;

  @override
  Widget build(BuildContext context) {
    DateTime furry = DateTime.fromMillisecondsSinceEpoch(epochy * 1000);

    String formtime = DateFormat.Hm().format(furry);

    DateTime abro = DateTime.now();

    return Text(
      formtime,
      style: const TextStyle(color: Colors.white),
    );
  }
}
