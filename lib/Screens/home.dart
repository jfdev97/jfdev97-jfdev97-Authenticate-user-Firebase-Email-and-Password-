import 'package:flutter/material.dart';
import 'package:loginfire/Provider/auth_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                // Sign out User
                AuthClass().signOut();
              }),
        ],
      ),
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
