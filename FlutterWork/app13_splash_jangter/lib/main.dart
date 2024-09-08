import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'screens/login/Login.dart';

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
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // 약 3초간 스플레쉬 화면이 보이고 로그인 화면으로 돌아간다
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      // 3초 기다린 후 해야 될것을 코딩 > 로그인 화면 전환
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Login(),
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          child: LottieBuilder.asset('lib/images/loading.json'),
        )
      ),
    );
  }
}


