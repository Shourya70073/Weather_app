import 'dart:convert';

import 'package:http/http.dart';

class networking {

  Future getcitydata(String name) async{
    Response r = await get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=7c035365890b48e9937151204221606&q=$name&aqi=no'));
    if (r.statusCode == 200) {
      String data = r.body;
      return jsonDecode(data);
    } else {
      return -1;
    }

  }
  Future getdata(var long, var lati) async {
    var t = lati.toString() + "/" + long.toString();
    Response r = await get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=7c035365890b48e9937151204221606&q=$lati,$long&aqi=no'));
    if (r.statusCode == 200) {
      String data = r.body;
      return jsonDecode(data);
    } else {
      return -1;
    }
  }
}
