import 'package:clima_weather_app/screens/loading_screen.dart';
import 'package:http/http.dart'  as http;
import 'dart:convert';

class NetWorkHelper{
  final String url;
  NetWorkHelper(this.url);

  Future getData() async
  {
    http.Response response = await http.get(
        Uri.parse(url));
    if(response.statusCode==200)
    {
      String data = response.body;
       var decodeData = jsonDecode(data);
       return decodeData;
    }
    else
    {
      print(response.statusCode);
    }
  }
}