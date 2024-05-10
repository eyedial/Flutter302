import 'package:app4_multiroute/screens/ScreenB.dart';
import 'package:flutter/material.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenMain'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ScreenA
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/a');
              },
              child: Text(
                'ScreenA',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            // ScreenB
            ElevatedButton(
              // ScreenB가 눌렸을때
              onPressed: (){
                Navigator.pushNamed(context, '/b');
              },
              child: Text(
                'ScreenB',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
