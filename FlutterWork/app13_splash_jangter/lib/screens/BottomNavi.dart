import 'package:app13_splash_jangter/Common/CommonUtil.dart';
import 'package:app13_splash_jangter/service/UserService.dart';
import 'package:flutter/material.dart';

import '../home/MyHome.dart';
import '../jangter/JangterPage.dart';
import '../model/JangterModel.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  // 선택된 메뉴 인덱스 : 0 ~ 4 > _xxxx 의 뜻은 지역변수
  int _selIndex = 0;

  List<JangterModel>? jangterList;
  Future<void> initJangter() async{
    // 모든 장터정보를 가져온다
    jangterList = await getJangter();
  }

  @override
  Widget build(BuildContext context) {
    print('loginUser : ${CommonUtil.loginUser!.user_profile}');

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        // 다른 메뉴를 선택했을때
        onDestinationSelected: (int index) async{
          print('index : $index');

          if(index == 1){
            await initJangter();
          }


          setState(() {
            _selIndex = index;
          });
        },
        // 선택되었을때 바탕색
        indicatorColor: Colors.amber,
        selectedIndex: _selIndex,

        // 메뉴의 갯수만큼 NavigationDestination을 구현한다
        destinations: [
          NavigationDestination(
            // 선택되었을때 아이콘
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: '동네장터',
          ),NavigationDestination(
            // 머티리얼 디자인 : 뱃지 > label이 null이 아니면 글씨가 써진 큰원
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.message_sharp),
            ),
            label: '대화방',
          ),NavigationDestination(
            icon: Icon(Icons.bus_alert),
            label: '버스Go',
          ),NavigationDestination(
            icon: Icon(Icons.exit_to_app),
            label: '로그아웃',
          ),

        ],
      ),

      // 내가 메뉴를 선택했을때 이동할 위젯(클래스)
      body: <Widget>[
        MyHome(),
        JangterPage(jangterList: jangterList),
        // Chatting(),
        // BusGo(),
        // LogOut(),
      ][_selIndex],

    );
  }
}
