import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form/model/user.dart';

import 'user_info_page.dart';

class RegisterHomePage extends StatefulWidget {
  const RegisterHomePage({super.key});

  @override
  State<RegisterHomePage> createState() => _RegisterHomePageState();
}

class _RegisterHomePageState extends State<RegisterHomePage> {
  bool _hidepass = true;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  List<String> _countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'India',
    'Germany',
    'France',
    'Japan',
    'China',
    'Brazil',
  ];
  String? _selectedCountry;

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = User(
    name: '',
    story: '',
    phoneNumber: '',
    email: '',
    country: '',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocus.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full name *',
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _nameController.clear();
                  },
                  child: Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.red,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              validator: _validateName,
              onSaved: (value) {
                newUser.name = value ?? '';
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (value) {
                _fieldFocusChange(context, _nameFocus, _passFocus);
              },

              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone number *',
                hintText: 'Where can we reach you?',
                helperText: 'e.g. +1 234 567 8900',
                helperStyle: TextStyle(color: Colors.blueGrey),
                prefixIcon: Icon(Icons.call),
                suffixIcon: GestureDetector(
                  onLongPress: () {
                    _showMessage(message: 'Long press to clear');
                  },
                  child: Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.red,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'^[0-9+() -]*$'), allow: true),
              ],
              validator: (value) => _validatePhoneNumber(value)
                  ? null
                  : 'Please enter a valid phone number',
              onSaved: (value) => newUser.phoneNumber = value ?? '',
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 
              'Email Address *',
              hintText: 'Enter your email address',
              icon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
            onSaved: (value) => newUser.email = value!,
            ),

            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              onChanged: (country) {
                print(country);
                setState(() {
                  _selectedCountry = country;
                  
                });
              },
              items:
                  _countries.map((String country) {
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
              
           ),

            SizedBox(height: 25.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Life Story *',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              controller: _storyController,
              // Remove onSaved assignment to final field

            ),


            SizedBox(height: 10.0),
            TextFormField(
              focusNode: _passFocus,
              decoration: InputDecoration(
                labelText: 'Password *',
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
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInfoPage(
                      userInfo: newUser,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm () {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Here you can handle the form submission, e.g., send data to a server
      _showDialog(name: _nameController.text);
      
    } else {
      _showMessage(message: 'Please correct the errors in the form');
    }
  }

  void _showMessage ({ required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(message),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            // Do something when the user presses the action button
          },
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  void _showDialog({required String name}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Successful'),
          content: Text('Welcome, $name!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool _validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return false;
    }
    // Basic phone number validation: must be at least 10 digits
    final phoneExp = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');
    return phoneExp.hasMatch(value.trim());
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailExp.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
