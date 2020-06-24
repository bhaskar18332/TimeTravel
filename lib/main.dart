import 'package:flutter/material.dart';
import 'package:myapp1/Pages/choose_location.dart';
import 'package:myapp1/Pages/loading.dart';
import 'package:myapp1/Pages/home.dart';

void main()=>runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(), 
  },
  debugShowCheckedModeBanner: false,
));