import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Common {
  /// 클릭하면 팝업창이 뜨게하는 매소드
  static void showPopup(BuildContext context, String title, String imgPath,
      String price, String address, String liked) {
    bool isLiked = false; // 좋아요가 눌려져 있는가
    int likeConunt = int.parse(liked);

    // 플러터가 제공해주는 다이얼로그
    showDialog(
      context: context,
      builder: (context){
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),

            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  // ClipRRect : 어떤것 담을것이라 보면 된다 (R: round)
                  // 이미지
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imgPath,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                  SizedBox(height: 15,),
                  // title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // price
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
                  // address
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // 좋아요 버튼은 pub.dev에서 like_button 검색


              
                ],
              
              ),
            ),
          ),
        );
      },
    );
  }
}
