import 'package:app13_splash_jangter/Common/CommonUtil.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 프로필 이미지를 등록했다면 그 이미지를 보이고 아니면 디폴트 이미지
              CircleAvatar(
                backgroundImage:
                  CommonUtil.loginUser!.user_profile!.contains('null')
                  ? AssetImage('lib/images/guest.png') as ImageProvider
                  : NetworkImage('${CommonUtil.loginUser!.user_profile}'),
                radius: 90,
              ),
              SizedBox(height: 40,),
              Text(
                '${CommonUtil.loginUser!.user_id}님 반갑습니다',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
