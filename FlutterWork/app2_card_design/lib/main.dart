import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyCardPage(),
    );
  }
}

class MyCardPage extends StatelessWidget {
  const MyCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text('MY CARD'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 35, 30, 0),
        child: Column(
          // 좌우 정렬시 사용
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지 넣는법 : pubspec.yaml 파일에 경로를 넣어줌
            // lib/images폴더를 만들어 그안에 넣어줌
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/binggo_after.gif'),
                // 이미지 크기 조절
                radius: 60,
              ),
            ),
            // 줄 긋고 간격벌리기
            Divider(
              height: 80,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'BINGGO',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'BINGGO POWER LEVEL',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '14',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '얼음번개',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '눈의 얼음의 정수 넣기',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '눈 내릴때 얼음길 만들기',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/binggobefore.png'),
                // 이미지 크기 조절
                radius: 40,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
