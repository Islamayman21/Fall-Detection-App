// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_proj/splash_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}

