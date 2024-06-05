import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        shadowColor: Colors.transparent,
        margin: EdgeInsets.all(8),
        child: SizedBox.expand(
          child: Center(
            child: Text(
                'Home Page',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
