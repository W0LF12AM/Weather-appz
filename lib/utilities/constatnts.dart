import 'package:flutter/material.dart';

const TexfieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  suffixIcon: Icon(Icons.search),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide.none),
);
