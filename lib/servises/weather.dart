import 'package:clima_weather_app/servises/location.dart';
import 'package:clima_weather_app/servises/network.dart';
import 'package:clima_weather_app/utils/constants.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName)async
  {
    var url = "$openWeatherMapUrl?q=$cityName&appid=$key&units=metric";
    NetWorkHelper netWorkHelper = NetWorkHelper(url);
    var weatherData = await netWorkHelper.getData();
    return weatherData;

  }

  Future<dynamic> getLocationWeather() async
  {
    Location location = Location();
   await location.getCurrentLocation();
    NetWorkHelper netWorkHelper = NetWorkHelper(
        "$openWeatherMapUrl?lat=${location.latitude}"
            "&lon=${location.longitude}"
            "&appid=$key&units=metric"
    );
   var weatherData = await netWorkHelper.getData();
   return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}