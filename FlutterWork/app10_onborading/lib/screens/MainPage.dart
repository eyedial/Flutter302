import 'package:app10_onborading/screens/OnBoardingPage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MainPage',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'dokdo',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Main Screen',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => OnBoardingPage()));
              },
              child: Text('Go to OnBoarding Screen'),
            ),

          ],
        ),
      ),

    );
  }
}
