import 'package:clima_weather_app/utils/constants.dart';
import 'package:flutter/material.dart';
class CityScreen extends StatefulWidget {
  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
   String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/city_background.jpg"),
            fit: BoxFit.cover,
          )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
             children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                    icon: Icon(Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 50,),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: kTextFieldItem(),
                  onChanged: (value){
                    cityName = value;
                  },
                ),
              ),
              TextButton(onPressed:(){
                Navigator.pop(context,cityName);
              },
                  child: Text("Get Weather",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
