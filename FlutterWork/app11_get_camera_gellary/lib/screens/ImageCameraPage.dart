import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ImageCameraPage extends StatefulWidget {
  const ImageCameraPage({super.key});

  @override
  State<ImageCameraPage> createState() => _ImageCameraPageState();
}

class _ImageCameraPageState extends State<ImageCameraPage> {
  final imagepicker = ImagePicker();
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
              child: imageFile != null
              ? Image.file(File(imageFile!.path), fit: BoxFit.fill,)
              : Image.asset(
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
                ShowPictureDialog();
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
            // imageFile 이 null이 아닐때는 파일에 저장된 이미지를 보여주고
            // null인 경우에는 images에 저장해놓은 이미지를 보여준다
            backgroundImage: imageFile != null
            ? FileImage(File(imageFile!.path)) as ImageProvider
            : AssetImage('lib/images/user1.png'),
          )
        ],
      ),
    );
  }

  Future<void> ShowPictureDialog() async{
    await showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: Text('Select Action'),
            children: [
              SimpleDialogOption(
                child: Text('Open Gellary'),
                onPressed: (){
                  Navigator.pop(context);
                  // 갤러리에서 사진 가져오기
                  getFromGellary();
                },
              ),
              SimpleDialogOption(
                child: Text('Open Camera'),
                onPressed: (){
                  Navigator.pop(context);
                  // 카메라에서 사진 가져오기
                  getFromCamera();
                },
              )
            ],
          );
        }
    );
  }

  /// 갤러리에서 사진 가져오기 매소드
  void getFromGellary() async{
    final pickedFile = await imagepicker.pickImage(
        source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    // 이미지가 선택이 되면 null이 아니다 > 반드시 state에 변경사항을 알려야함
    if(pickedFile != null){
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
  /// 카메라고 찍어서 사진 가져오기
  void getFromCamera() async {
    final pickedFile = await imagepicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if(pickedFile != null){
      setState(() {
        imageFile = File(pickedFile.path);
        // 저장
        saveToGallery();
      });
    }
  }

  /// 저장장치에 저장하기
  Future<void> saveToGallery() async{
    // gallery saver 호출
    await GallerySaver.saveImage(
      // 비디오파일 : saveVideo
      imageFile!.path, // 이미지파일 있는곳 요청
      //albumName : 폴더명,
    );
    // 화면 갱신
    setState(() {});
  }

}
