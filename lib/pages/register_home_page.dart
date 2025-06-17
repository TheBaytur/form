import 'package:flutter/material.dart';

class RegisterHomePage extends StatefulWidget {
  const RegisterHomePage({super.key});

  @override
  State<RegisterHomePage> createState() => _RegisterHomePageState();
}

class _RegisterHomePageState extends State<RegisterHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Form Flutter Demo'),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}