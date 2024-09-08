import 'package:app13_splash_jangter/model/JangterModel.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  // 장터의 데이터를 생성자에서 받아서 사용한다
  final JangterModel jangterModel;

  // named argument : 반드시 보낼때 이름을 쓰고 보낸다
  DetailPage({super.key, required this.jangterModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jangterModel.title),
        elevation: 0,
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
            ),

          ],

        ),
      ),

    );
  }
}
