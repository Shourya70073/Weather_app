// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:weather_app/location_service.dart';
import 'package:weather_app/networking_service.dart';
import 'city.dart';

class result extends StatefulWidget {
  result({@required this.r});
  final r;

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  var cit;
  var count;
  var temp;
  var pressure;
  var humidity;
  var visiblity;
  var windspeed;
  var la;
  var lo;
  var des;
  var ic;
  var time;
  var s;
  var name;
  var data;
  @override
  void initState() {
    // TODO: implement initState
    s = widget.r;
    check();
  }

  void check() {
    if (s == null) {
      updateui(data);
    } else {
      updateui(s);
    }
  }

  void updateui(var si) {
    cit = si["location"]["name"];
    count = si["location"]["country"];
    temp = si["current"]["temp_c"];
    temp = temp.toInt();
    windspeed = si["current"]["wind_mph"];
    humidity = si["current"]["humidity"];
    pressure = si["current"]["pressure_mb"];
    pressure = pressure.toInt();
    visiblity = si["current"]["vis_km"];
    visiblity = visiblity.toInt();
    la = si["location"]["lat"];
    lo = si["location"]["lon"];

    des = si["current"]["condition"]["text"];
    ic = si["current"]["condition"]["icon"];
    time = si["location"]["localtime"];
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Result",
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 25, 15, 30),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        "$cit",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Quicksand"),
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      GestureDetector(
                        onTap: () async {
                          name = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return city();
                              },
                            ),
                          );
                          networking n2 = new networking();
                          data = await n2.getcitydata(name);
                          s = null;
                        },
                        child: Container(
                            child: Icon(
                          Icons.location_city,
                          size: 30,
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "$time",
                    style: TextStyle(
                        color: Colors.grey[600], fontFamily: "Quicksand"),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Image(
                            image: NetworkImage("https:" + "$ic"),
                            height: 80,
                            width: 200,
                          ),
                          Text(
                            "$temp" + "\u00B0" + "C",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Quicksand"),
                          ),
                          Text(
                            "$des",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontFamily: "Quicksand",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Quicksand",
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Pressure",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "$pressure" + "mb",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Humidity",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "$humidity" + "%",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Visiblity",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "$visiblity" + " KM",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Wind Speed",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "$windspeed" + "mph",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 65,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Latitude",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "$la",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Longitude",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "$lo",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Quicksand",
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
