import 'package:flutter/material.dart';
import 'package:rosseti/pages/home.dart';
import 'package:rosseti/pages/MainPage.dart';
import 'package:rosseti/pages/registration.dart';
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


    },
));
