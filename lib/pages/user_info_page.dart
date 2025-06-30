import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Information'), centerTitle: true),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Story', style: TextStyle(fontSize: 16.0)),
              leading: Icon(Icons.person, size: 40.0, color: Colors.black54),
              trailing: Text('Country', style: TextStyle(fontSize: 16.0)),
            ),
            ListTile(
              title: Text(
                'Phone number',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('+1 123-456-7890', style: TextStyle(fontSize: 16.0)),
              leading: Icon(Icons.phone, size: 40.0, color: Colors.black54),
              trailing: Text('123-456-7890', style: TextStyle(fontSize: 16.0)),
            ),
            ListTile(
              title: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Email address', style: TextStyle(fontSize: 16.0)),
              leading: Icon(Icons.email, size: 40.0, color: Colors.black54),
              trailing: Text('Email address', style: TextStyle(fontSize: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}
