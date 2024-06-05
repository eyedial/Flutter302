import 'package:flutter/material.dart';

class ScreenD extends StatelessWidget {
  const ScreenD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenD'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Text(
            'ScreenD',
        style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
