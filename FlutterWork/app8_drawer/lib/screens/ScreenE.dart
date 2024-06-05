import 'package:flutter/material.dart';

class ScreenE extends StatelessWidget {
  const ScreenE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenE'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Text(
            'ScreenE',
        style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
