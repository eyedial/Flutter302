import 'package:flutter/material.dart';

class ColumnRow extends StatelessWidget {
  const ColumnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 빈공간을 만들때
      body: SizedBox(
        width: double.infinity,
        child: Column(
          // 주축 : 상하
          mainAxisAlignment: MainAxisAlignment.start,
          // 보조축 : 좌우
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // 위젯을 넣는 공간
            Container(
              height: 50,
              width: 50,
              color: Colors.red,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 50,
              color: Colors.blue,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 50,
              color: Colors.black,
            ),

            SizedBox(
              height: 15,
            ),

            Row(
              // 주축 : 좌우
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.black,
                ),
              ],
            ),

            SizedBox(
              height: 15,
            ),

            Row(

              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.black,
                ),
              ],
            ),

          ],
        ),


      ),
    );
  }
}
