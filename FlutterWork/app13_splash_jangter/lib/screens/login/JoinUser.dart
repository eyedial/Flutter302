import 'dart:io';

import 'package:app13_splash_jangter/Common/CommonUtil.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../service/UserService.dart';


class JoinUser extends StatefulWidget {
  const JoinUser({super.key});

  @override
  State<JoinUser> createState() => _JoinUserState();
}

class _JoinUserState extends State<JoinUser> {

  File? profile_image;
  String? profile_imgPath;
  // 이미지피커 객체를 만든다
  final imagePicker = ImagePicker();

  // TextFormField에  값이 변화되었는지 알거나 값을 가져오고 싶을때는 controller를
  // 생성해서 붙여줘야 한다. 그리고 사용한 후에는 dispose를 이용해 메모리에서 제거
  TextEditingController ctrlId = TextEditingController();
  TextEditingController ctrlPw = TextEditingController();
  TextEditingController ctrlName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('회원가입'),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 프로필 사진
                    // 권한설정 : android > app > src > build.gradle 23
                    // image_picker, gallery_saver
                    CircleAvatar(
                      radius: MediaQuery.sizeOf(context).width * 0.25,
                      // 삼항연산자를 이용해 이미지가 null일때는 기본이미지를 보여주고
                      // 이미지가 null이 아닐때는 선택한 이미지를 보여준다
                      backgroundImage: 
                        profile_image != null
                        ? FileImage(File(profile_image!.path)) as ImageProvider
                        : AssetImage('lib/images/camera.png'),
                    ),
                    SizedBox(height: 10,),
                    // 갤러리나 카메라로 찍은 사진을 가져오는 버튼
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        // 갤러리에서 가져오기
                        ElevatedButton(
                          onPressed: (){
                            getFromGallery();
                          },
                          child: Text('갤러리'),
                        ),
                        SizedBox(width: 20,),
                        // 카메라에서 가져오기
                        ElevatedButton(
                          onPressed: (){
                            getFromCamera();
                          },
                          child: Text('카메라'),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    // 각 텍스트 폼필드에 controller를 생성해서 달아준다
                    // ID
                    TextFormField(
                      controller: ctrlId,
                      decoration: InputDecoration(
                        // 입력줄 앞에 아이콘을 넣어준다
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.black87,
                        ),
                        // 입력줄 바깥쪽 선을 만듬
                        enabledBorder: buildOutlineInputBorder(),
                        // 포커스가 없을때는 모양이 유지되나 있으면 모양이 사라짐
                        focusedBorder: buildOutlineInputBorder(),
                        // 에러가 났을때도 모양을 유지
                        errorBorder: buildOutlineInputBorder(),

                        hintText: 'User ID : 3글자 이상',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black54
                        ),
                        // 하지만 글자에 비해 창 크기가 너무 크다
                        // TextFormField에서 자주 사용되므로 잘 기억
                        contentPadding: EdgeInsets.all(10),
                
                      ),
                    ),
                    SizedBox(height: 8,),
                    // Password
                    TextFormField(
                      controller: ctrlPw,
                      decoration: InputDecoration(
                        // 입력줄 앞에 아이콘을 넣어준다
                        prefixIcon: Icon(
                          Icons.enhanced_encryption_sharp,
                          color: Colors.black87,
                        ),
                        // 입력줄 바깥쪽 선을 만듬
                        enabledBorder: buildOutlineInputBorder(),
                        // 포커스가 없을때는 모양이 유지되나 있으면 모양이 사라짐
                        focusedBorder: buildOutlineInputBorder(),
                        // 에러가 났을때도 모양을 유지
                        errorBorder: buildOutlineInputBorder(),

                        hintText: 'User PW : 3글자 이상',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black54
                        ),
                        // 하지만 글자에 비해 창 크기가 너무 크다
                        // TextFormField에서 자주 사용되므로 잘 기억
                        contentPadding: EdgeInsets.all(10),

                      ),
                    ),
                    SizedBox(height: 8,),
                    // Name
                    TextFormField(
                      controller: ctrlName,
                      decoration: InputDecoration(
                        // 입력줄 앞에 아이콘을 넣어준다
                        prefixIcon: Icon(
                          Icons.face,
                          color: Colors.black87,
                        ),
                        // 입력줄 바깥쪽 선을 만듬
                        enabledBorder: buildOutlineInputBorder(),
                        // 포커스가 없을때는 모양이 유지되나 있으면 모양이 사라짐
                        focusedBorder: buildOutlineInputBorder(),
                        // 에러가 났을때도 모양을 유지
                        errorBorder: buildOutlineInputBorder(),

                        hintText: 'User Name',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black54
                        ),
                        // 하지만 글자에 비해 창 크기가 너무 크다
                        // TextFormField에서 자주 사용되므로 잘 기억
                        contentPadding: EdgeInsets.all(10),

                      ),
                    ),
                    SizedBox(height: 8,),
                    ButtonBar(
                      // 버튼을 가운데 정렬
                      alignment: MainAxisAlignment.center,
                      children: [
                        // 가입하기 버튼 : 누르면 유효성 검사 후 수파베이스에 저장
                        ElevatedButton(
                          onPressed: () async {
                            // 아이디가 3자리 이상, 암호도 3자리 이상
                            // 텍스트에 접근 : 붙여놓은 controller로 접근한다
                            String id = ctrlId.text;
                            String pw = ctrlPw.text;
                            String name = ctrlName.text;
                            if(id.length < 3 && pw.length < 3){
                              ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                content: Text(
                                  '회원아이디나 패스워드가 비어있거나 3자리 미만입니다',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 3),
                              ));
                              return;
                            }
                            // 모두 3글자가 넘었으므로 id와 pw를 가지고
                            // 데이터베이스에서 넘어온 확인 문자로 회원가입이 되어있는지 확인한다
                            bool isJoin =
                              await joinUser(id, pw, name, profile_image);
                            if(isJoin){
                              Navigator.pop(context);
                              CommonUtil.showToast('축하합니다\n정상적으로 가입되었습니다');
                            }else{
                              CommonUtil.showToast('죄송합니다\n다시한번 시도해 주세요');
                            }

                          },
                          child: Text('가입하기'),
                        ),
                        SizedBox(width: 10,),
                        // 가입하지 않고 나중에
                        ElevatedButton(
                          onPressed: (){
                            // 로그인 화면으로 돌아간다
                            Navigator.pop(context);
                          },
                          child: Text('나중에'),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black54,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(35),
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
        profile_image = File(pickerFile.path);
        profile_imgPath = pickerFile.path;
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
        profile_image = File(pickerFile.path);
        profile_imgPath = pickerFile.path;
      });
    }
  }

}
