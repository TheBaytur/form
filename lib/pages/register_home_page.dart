import 'package:flutter/material.dart';

class RegisterHomePage extends StatefulWidget {
  const RegisterHomePage({super.key});

  @override
  State<RegisterHomePage> createState() => _RegisterHomePageState();
}

class _RegisterHomePageState extends State<RegisterHomePage> {

final _nameController = TextEditingController();

List<String> _countries = ['United States', 'Canada',
    'United Kingdom',
    'Australia',
    'India',
    'Germany',
    'France',
    'Japan',
    'China',
    'Brazil'
  ];

  String? _selectedCountry;

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    // Additional initialization if needed
  }

@override
  void dispose() {
    _nameController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(BuildContext context, FocusNode currentFocus,
  FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

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
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (value) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full name *',
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(
                  Icons.delete_outline_outlined, color: Colors.red
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (value) {
                _fieldFocusChange(context, _nameFocus, _passFocus);
              },
              
              obscureText: true,
              decoration: InputDecoration(labelText: 'Phone number *',
              hintText: 'Where can we reach you?',
              helperText: 'e.g. +1 234 567 8900',
              helperStyle: TextStyle(color: Colors.blueGrey),
              prefixIcon: Icon(Icons.phone),
              suffixIcon: Icon(
                Icons.delete_outline_outlined, color: Colors.red
                ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.phone,

            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email Address *'),         
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCountry = newValue;
                });
              },
              items: _countries.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              decoration: InputDecoration(
                icon: Icon(Icons.flag),
                labelText: 'Country *',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a country';
                }
                return null;
              },
            ),
            SizedBox(height: 25.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Life Story *',
              border: OutlineInputBorder(),
              ),         
            ),
             SizedBox(height: 10.0),
            TextFormField(
              focusNode: _passFocus,
              decoration: InputDecoration(labelText: 'Password *',
              suffixIcon: IconButton(
                 icon: Icon(Icons.visibility),
                 onPressed: () {
                   // Toggle password visibility
                 },
                 ),
                 icon: Icon(Icons.security),
              ),         
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