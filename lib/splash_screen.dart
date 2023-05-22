// ignore_for_file: unnecessary_new, prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => LoginScreen()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: new Color(0xFF01579B),
                gradient: LinearGradient(colors: [(new  Color(0xFF01579B)), new Color(0xFF1565C0)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          Center(
            child: Container(
              child: Image.asset("images/fall.png"),
            ),
          ),

           
             Container(
              margin: EdgeInsets.only(left: 75, top: 550),
              child: Text(
                "Fall Detection System",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,
              ),
            ),
          ),


        ],
      ),
    );
  }
}