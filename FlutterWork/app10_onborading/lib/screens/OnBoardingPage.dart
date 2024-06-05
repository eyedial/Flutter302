import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'MainPage.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: '나의 앱에 방문한것을 환영합니다',
          body: '이 앱은 여행을 가고 싶을때 가고 싶은 여행정보와 알아두면'
              '좋은 팁을 적을수 있고 교통편과 그곳의 풍광을 찍어서 '
              '공유하는 여행정보 커뮤니티입니다',
          image: Image.asset('lib/images/intro1.jpg'),
          // 페이지 디자인
          decoration: buildPageDecoration()
        ),

        PageViewModel(
            title: '나의 앱에 방문한것을 환영합니다',
            body: '이 앱은 여행을 가고 싶을때 가고 싶은 여행정보와 알아두면'
                '좋은 팁을 적을수 있고 교통편과 그곳의 풍광을 찍어서 '
                '공유하는 여행정보 커뮤니티입니다',
            image: Image.asset('lib/images/intro2.jpg'),
            // 페이지 디자인
            decoration: buildPageDecoration()
        ),

        PageViewModel(
            title: '나의 앱에 방문한것을 환영합니다',
            body: '이 앱은 여행을 가고 싶을때 가고 싶은 여행정보와 알아두면'
                '좋은 팁을 적을수 있고 교통편과 그곳의 풍광을 찍어서 '
                '공유하는 여행정보 커뮤니티입니다',
            image: Image.asset('lib/images/intro3.jpg'),
            // 페이지 디자인
            decoration: buildPageDecoration()
        ),

      ],
      // 마지막까지 왔을때 표시글자나 문자
      done: Text('done'),
      // 위의 done 버튼이 클릭이 되었을때 무엇을 할 것인가
      // 여기서는 메인 페이지로 이동하겠습니다
      onDone: (){
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => MainPage()));
      },
      // 페이지가 여러개일 경우 중간에서 넘기는 아이콘이나 글자
      next: Icon(Icons.arrow_forward),
      // 페이지를 읽기 싫어하는 사람은 skip버튼을 누르면 맨마지막으로 이동
      showSkipButton: true,
      skip: Text('건너뛰기'),
      // 아래쪽 선택한 페이지 점들 변화시키기
      dotsDecorator: DotsDecorator(
        color: Colors.blue,
        activeColor: Colors.red,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        )
      ),
      // 화면 애니메이션 : Curves 위에 마우스를 대면 여러가지가 나옴
      curve: Curves.bounceInOut,
    );
  }

  PageDecoration buildPageDecoration() {
    return PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          bodyTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.black45,
            fontFamily: 'dokdo',
          ),
          imagePadding: EdgeInsets.only(top: 40),
          pageColor: Colors.orange,
        );
  }

}
