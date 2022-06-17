// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class city extends StatefulWidget {
  const city({Key? key}) : super(key: key);

  @override
  State<city> createState() => _cityState();
}

class _cityState extends State<city> {
  String t = "";
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "City",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Get Weather"),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image(
                    image: AssetImage("img/cloudy.png"),
                    height: 150,
                    width: 150,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter the City name",
                        filled: true,
                        fillColor: Colors.white),
                    onChanged: (value) {
                      t = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  color: Colors.black,
                  splashColor: Colors.grey,
                  onPressed: () {
                    Navigator.pop(context, t);
                  },
                  child: Text(
                    "Get Weather",
                    style: TextStyle(color: Colors.white),
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
