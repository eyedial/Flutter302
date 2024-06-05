import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCameraPage extends StatefulWidget {
  const ImageCameraPage({super.key});

  @override
  State<ImageCameraPage> createState() => _ImageCameraPageState();
}

class _ImageCameraPageState extends State<ImageCameraPage> {
  File? imageFile;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 사각형 이미지
          Container(
            margin: EdgeInsets.all(20),
            width: size.width,
            height: size.height * 0.3,
            color: Colors.blueGrey,
            child: FittedBox(
              child: Image.asset(
                'lib/images/user1.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // 가운데 버튼
          Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 30),
            child: ElevatedButton(
              onPressed: (){
                // 버튼을 클릭하면 팝업창이 띄워진다
                buildShowPictureDialog();
              },
              child: Text(
                '일단 눌러주세요',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                fixedSize: Size(size.width - 40, size.height * 0.07)
              ),
            ),
          ),
          // 원형 이미지
          CircleAvatar(
            radius: size.width * 0.25,
            backgroundImage: AssetImage('lib/images/user1.png'),
          )
        ],
      ),
    );
  }

  Future<void> buildShowPictureDialog() async{
    await showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: Text('Select Action'),
            children: [
              SimpleDialogOption(
                child: Text('Open Gellary'),
                onPressed: (){
                  // 갤러리에서 사진 가져오기

                },
              ),
              SimpleDialogOption(
                child: Text('Open Camera'),
                onPressed: (){
                  // 카메라에서 사진 가져오기

                },
              )
            ],
          );
        }
    );
  }

  /// 갤러리에서 사진 가져오기 매소드
  void getFromGellary() async{

  }

}
