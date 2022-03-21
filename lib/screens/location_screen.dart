import 'package:clima_weather_app/screens/city_screen.dart';
import 'package:clima_weather_app/servises/weather.dart';
import 'package:flutter/material.dart';
class LocationScreen extends StatefulWidget {
 final locationWeather;
 LocationScreen(this.locationWeather, );
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  String? cityName;
  int? temp;
  String? weatherIcon;
  String? weatherMessage;

  @override
  void initState(){
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData)
  {
      setState(() {
        if(weatherData==null)
        {
          temp=0;
          weatherIcon="error";
          weatherMessage="unable to get weatherData";
          cityName = "";
          return ;
        }

        cityName= weatherData['name'];
        double temp2 = weatherData["main"]["temp"];
        temp = temp2.toInt();
        var condition = weatherData["weather"][0]["id"];
        weatherIcon = weatherModel.getWeatherIcon(condition);
        weatherMessage = weatherModel.getMessage(temp!);
      });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/location_background.jpg",),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.8),
                BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () async {
                          var weatherData = await weatherModel.getLocationWeather();
                          updateUi(weatherData);
                      },
                      child: Icon(Icons.near_me,
                        color: Colors.white,
                        size: 50,),
                  ),
                  TextButton(
                    onPressed: () async{
                       var typeName = await Navigator.push(context,MaterialPageRoute(
                           builder: (context)=>CityScreen()));
                       print(typeName);
                       if(typeName !=null)
                       {
                         var weatherData = await weatherModel.getCityWeather(typeName);
                         updateUi(weatherData);
                       }

                    },
                    child: Icon(Icons.location_city,
                      color: Colors.white,
                      size: 50,),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text("$temp ",
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(weatherIcon!,
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text("${weatherMessage} in ${cityName}",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 70,
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
