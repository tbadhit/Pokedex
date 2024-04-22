import 'package:flutter/material.dart';

Color colorGenerator(String value) {
  switch (value) {
    case "black":
      return Colors.black;
    case "blue":
      return Colors.blue;
    case "brown":
      return Colors.brown;
    case "gray":
      return Colors.grey;
    case "green":
      return Colors.green;
    case "pink":
      return Colors.pink;
    case "purple":
      return Colors.purple;
    case "red":
      return Colors.red;
    case "white":
      return Colors.white;
    case "yellow":
      return Colors.yellow;
    default:
      return Colors.transparent;
  }
}
