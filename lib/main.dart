import 'package:clima_weather_app/screens/loading_screen.dart';
import 'package:clima_weather_app/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: LoadingScreen(openWeatherMapUrl),
     );
   }
 }
