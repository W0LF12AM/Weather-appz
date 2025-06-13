// ignore_for_file: prefer_const_constructors

import 'package:clima/utilities/constatnts.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: TexfieldInputDecoration,
              onChanged: (value) {
                cityName = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            FilledButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text('Search'))
          ],
        )),
      ),
    );
  }
}
