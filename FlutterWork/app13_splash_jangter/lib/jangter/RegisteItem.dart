import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisteItem extends StatefulWidget {
  const RegisteItem({super.key});

  @override
  State<RegisteItem> createState() => _RegisteItemState();
}

class _RegisteItemState extends State<RegisteItem> {

  File? item_image;
  String? item_imgPath;
  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('동네장터 - 물건 등록하기'),
        elevation: 0,
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: item_image != null
                ? FileImage(File(item_image!.path)) as ImageProvider
                : AssetImage('lib/images/camera.png'),
            ),
            SizedBox(height: 5,),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('갤러리'),
                ),
                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('카메라'),
                ),

              ],
            ),

          ],
        ),
      ),

    );
  }

  /// 갤러리에서 이미지 가져오기
  void getFromGallery() async {
    // ImagePicker 객체를 만들어서 해야 함 > 위에서 선언
    final pickerFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if(pickerFile != null){
      setState(() {
        item_image = File(pickerFile.path);
        item_imgPath = pickerFile.path;
      });
    }
  }

  /// 카메라에서 이미지 가져오기
  void getFromCamera() async {
    final pickerFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if(pickerFile != null){
      setState(() {
        item_image = File(pickerFile.path);
        item_imgPath = pickerFile.path;
      });
    }
  }

}
