// ignore_for_file: prefer_const_constructors
import 'result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/location_service.dart';
import 'package:weather_app/networking_service.dart';

class loading_screen extends StatefulWidget {
  const loading_screen({Key? key}) : super(key: key);

  @override
  State<loading_screen> createState() => _loading_screenState();
}

class _loading_screenState extends State<loading_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();
  }

  double lati = 0.0;
  double long = 0.0;
  void getlocation() async {
    Location l1 = new Location();
    await l1.getlco();
    long = l1.long;
    lati = l1.lati;
    networking n1 = new networking();
    var k = await n1.getdata(long, lati);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return result(r: k);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: "Loading",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.black,
            size: 50.0,
          ),
        ),
      ),
    ));
  }
}
