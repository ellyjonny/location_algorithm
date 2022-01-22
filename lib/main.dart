import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location_algorithm/screens/home.dart';
import 'package:location_algorithm/screens/host_location.dart';

void main() {
   final style = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  );
  SystemChrome.setSystemUIOverlayStyle(style);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  Homescreen(),
        '/locate': (context) => HostLocation()}
    );
  }
}

