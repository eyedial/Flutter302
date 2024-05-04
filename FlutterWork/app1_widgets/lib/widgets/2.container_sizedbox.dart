import 'package:flutter/material.dart';

class ContainerSizedbox extends StatelessWidget {
  const ContainerSizedbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              // 스타일 적용
              decoration: BoxDecoration(
                //배경색
                color: Colors.red,
                border: Border.all(
                  // 테두리 굵기
                  width: 10,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              height: 100,
              width: 100,
              // 스타일 적용
              decoration: BoxDecoration(
                //배경색
                color: Colors.blue,
                border: Border.all(
                  // 테두리 굵기
                  width: 10,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
