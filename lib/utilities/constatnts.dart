import 'package:flutter/material.dart';

const TexfieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    suffixIcon: Icon(Icons.search),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(color: Colors.grey),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.red, width: 2)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(color: Colors.black, width: 2)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.black, width: 2)));

final List<Color> morningGradient = [
  Color(0xFFADD8E6), // Light Blue
  Color(0xFF87CEEB), // Sky Blue
];

final List<Color> afternoonGradient = [
  Color(0xFF87CEEB), // Sky Blue
  Color(0xFFFFD700), // Golden Yellow
];

final List<Color> eveningGradient = [
  Color(0xFFFFA500), // Orange
  Color(0xFF800080), // Purple
  Color(0xFF191970), // Midnight Blue
];

final List<Color> nightGradient = [
  Color(0xFF191970), // Midnight Blue
  Color(0xFF87CEFA), // Light Sky Blue (buat efek transisi subuh)
];

const double h1 = 65;
const double h2 = 40;
const double h3 = 25;
const double h4 = 15;
const double h5 = 9;
