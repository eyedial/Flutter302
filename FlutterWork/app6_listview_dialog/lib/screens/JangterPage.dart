import 'package:flutter/material.dart';

class JangterPage extends StatefulWidget {
  const JangterPage({super.key});

  @override
  State<JangterPage> createState() => _JangterPageState();
}

class _JangterPageState extends State<JangterPage> {
  // 이미지경로(imgPath), 제목(title), 가격(price), 주소(address)
  List<String> imgPath = [
    'lib/images/'
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Listview - 동네장터',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      //body: ,
    );
  }
}
