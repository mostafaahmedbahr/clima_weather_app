
import 'package:flutter/material.dart';

const key = "8e99b8a928bdf5d9032b709af202c551";
const openWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";
InputDecoration kTextFieldItem() => InputDecoration(
  fillColor: Colors.white,
  filled: true,
  icon: Icon(Icons.location_city,
    color: Colors.white,),
  hintText: "Enter City Name",
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
    borderSide: BorderSide.none,
  ),

);