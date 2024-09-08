import 'package:app13_splash_jangter/Common/CommonUtil.dart';
import 'package:app13_splash_jangter/service/UserService.dart';

import '../BottomNavi.dart';
import '/screens/login/JoinUser.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TextField의 값을 변경하거나 변화되었는지 알아보거나 값을 가져오고 싶을때는
  // controller를 생성해서 붙여줘야 한다
  // 사용후에는 dispose를 사용하여 메모리에서 제거해줘야 한다, 간단한앱이니 그냥 놔둔다
  TextEditingController ctId = TextEditingController();
  TextEditingController ctPw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login - Supabase'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 로그인에 보이는 이미지
              CircleAvatar(
                backgroundImage: AssetImage('lib/images/login.jpg'),
                radius: MediaQuery.of(context).size.width * 0.25,
              ),
              // Form 안에 넣어서 정렬을 쉽게한다
              Form(
                child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                      ))),
                  child: Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        TextField(
                          controller: ctId,
                          decoration: InputDecoration(
                            labelText: 'Enter "ID"',
                          ),
                          // 키보드 입력타입을 알려준다
                          keyboardType: TextInputType.text,
                          //keyboardType: TextInputType.emailAddress,
                          //keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: ctPw,
                          decoration: InputDecoration(
                            labelText: 'Enter "PW"',
                          ),
                          // 키보드 입력타입을 알려준다
                          keyboardType: TextInputType.text,
                          // 타이핑시 패스워드는 보이지 않아야 한다
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ButtonBar(
                          // 버튼을 가운데로 정렬
                          alignment: MainAxisAlignment.center,
                          children: [
                            // 로그인 버튼 : 수파베이스에서 아이디와 패스워드를 확인한 후
                            //   Users테이블에 있다면 CommonUtil에 static으로 만들어
                            //   놓은 loginUser에 저장하여 어디서든 접근할수 있도록 한다
                            ElevatedButton(
                              onPressed: () async {
                                // 아이디와 비번을 가져와 수파베이스 테이블에 존재하는가 확인
                                String user_id = ctId.text;
                                String user_pw = ctPw.text;
                                // 수파베이스에 연결해 회원정보 테이블에 내가 보낸것과 동일한겻이
                                // 있으면 회원정보 모두를 가져와서 loginUser에 저장한다
                                await login(user_id, user_pw);
                                //print('loginUser id : ${CommonUtil.loginUser!.user_id}');
                                // 로그인 유저가 있으면 바텀네비게이션바 페이지(메인화면)로 이동한다
                                if(CommonUtil.loginUser != null){
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BottomNavi()));
                                // 로그인 유저가 없으면 안내 스낵바를 띄운다
                                }else{
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text(
                                        '로그인 정보를 확인해 주세요 !!!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    duration: Duration(seconds: 5),
                                    backgroundColor: Colors.blueAccent,
                                  ));
                                  // 쓰여진 글자를 지워준다
                                  // ctId.clear();
                                  // ctPw.clear();
                                }
                              },
                              child: Text('로그인'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            // 회원가입 버튼 : 회원가입 화면을 불러온다
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JoinUser(),
                                  ),
                                );
                              },
                              child: Text('회원가입'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
