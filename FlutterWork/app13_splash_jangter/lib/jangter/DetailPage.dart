import 'package:app13_splash_jangter/model/JangterModel.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

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
    bool isLiked = false; // 좋아요가 눌려져 있는가
    int likeCount =
      int.parse(widget.jangterModel.liked.toString()); // 좋아요 눌린 횟수
    int chatting =
    int.parse(widget.jangterModel.chatting.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jangterModel.title),
        elevation: 0,
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                //height: MediaQuery.of(context).size.height * 0.5,
                child: Image(
                  image: widget.jangterModel.imgPath!.contains('null')
                    ? AssetImage('lib/images/guest.png') as ImageProvider
                    : NetworkImage(widget.jangterModel.imgPath!),
                ),
              ),
              SizedBox(height: 15,),
              Text(
                '${widget.jangterModel.title}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                '${widget.jangterModel.price}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                '${widget.jangterModel.contents}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                '${widget.jangterModel.address}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 15,),
              // 좋아요 버튼을 누르면 애니메이션과 함께 색이 변하고 숫자1
              // 다시 누르면 회색 숫자 0 : 나중에 데이터베이스와 연동
              LikeButton(
                isLiked: isLiked,
                likeCount: likeCount,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('닫 기'),
                  ),
                  ElevatedButton(
                    onPressed: (){

                    },
                    child: Text('채팅하기'),
                  ),

                ],
              ),


            ],

          ),
        ),
      ),

    );
  }
}
