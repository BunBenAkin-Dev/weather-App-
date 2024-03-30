import 'package:flutter/material.dart';
import 'package:weather/weatherhome.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String Selected = '';
  List<String> filteredloca = [];
  List<String> county = [
    'New York City',
    'London',
    'Paris',
    'Tokyo',
    'Beijing',
    'Sydney',
    'Rio de Janeiro',
    'Moscow',
    'Cairo',
    'Rome',
    'Lagos',
    'Toronto',
    'Mumbai',
    'Istanbul',
    'Dubai',
    'Buenos Aires',
    'Seoul',
    'Berlin',
    'Mexico City',
    'Bangkok',
    'Johannesburg',
    'Los Angeles',
    'Amsterdam',
    'Singapore',
    'Madrid',
    'Jakarta',
    'Nairobi',
    'Riyadh',
    'Abu Dhabi',
    'Vancouver',
    'Prague',
    'Nigeria'
  ];

  void search(String query) {
    setState(() {
      Selected = query;

      filteredloca = county
          .where((element) => element.toLowerCase().contains(
                query.toLowerCase(),
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 35,
          child: TextFormField(
            onChanged: search,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: 'Enter the name of City'),
          ),
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return SafeArea(
            child: ListView.builder(
                itemCount: filteredloca.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pop(context, filteredloca[index]);
                    },
                    title: Text(
                      filteredloca[index],
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }));
      }),
    );
  }
}
