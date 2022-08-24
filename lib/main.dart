import 'package:flutter/material.dart';
import 'package:rosseti/pages/home.dart';
import 'package:rosseti/pages/MainPage.dart';
import 'package:rosseti/pages/registration.dart';
import 'package:rosseti/pages/Categories.dart';
import 'package:rosseti/pages/testSite.dart';
import 'package:rosseti/pages/aboutDelivery.dart';
import 'package:map/map.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
      primaryColor: const Color.fromRGBO(79, 79, 79, 1)
  ),
  initialRoute: '/',
    routes:{
      '/':(context) => MainPage(),
      '/home': (context) => const Home(),
      '/registration': (context) =>  LoginScreen(),
      '/categories': (context) =>  Categories(),
      '/test': (context) => TestPage(),
      '/delivery': (context) => DeliveryPage(),


    },
));
