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
          children: [
            TextField(decoration: InputDecoration(
              labelText: 'Full name *',
              hintText: 'Enter your full name',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone number *'),         
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email Address *'),         
            ),
            SizedBox(height: 25.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Life Story *'),         
            ),
             SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password *'),         
            ),
             SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Confirm Password *'),         
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}