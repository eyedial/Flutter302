import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedFlexiable extends StatelessWidget {
  const ExpandedFlexiable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 100,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                height: 50,
                color: Colors.grey,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
