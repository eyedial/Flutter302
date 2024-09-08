import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:app13_splash_jangter/model/UsersModel.dart';

class CommonUtil{
  // loginUser : 어느곳에서나 접근할수 있게 static
  static UsersModel? loginUser;


  /// 토스트 메세지 띄우는 매소드 : 토스트플러터 라이브러리 필요
  static void showToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}