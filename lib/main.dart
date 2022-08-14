import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api_recyclerview/Models/posts_model.dart';
import 'package:get_api_recyclerview/Pages/fourthpage.dart';
import 'package:get_api_recyclerview/Pages/registerPage.dart';
import 'package:get_api_recyclerview/Pages/thirdPage.dart';
import 'package:get_api_recyclerview/Utils/Routes.dart';
import 'package:get_api_recyclerview/Pages/firstpage.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: thirdPage(), 
    );
  }
}

