import 'package:flutter/material.dart';
import 'package:form/pages/register_home_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Form Flutter Demo - 2706 back',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: RegisterHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
