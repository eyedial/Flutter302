import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.red,
            ),

            Positioned(
              top: 100,
              left: 50,
              right: 50,
              child: Container(
                height: 250,
                width: 250,
                color: Colors.yellow,
              ),
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),

          ],
        ),
      ),
    );
  }
}
