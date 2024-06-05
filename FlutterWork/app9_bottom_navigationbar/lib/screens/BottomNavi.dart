import 'package:flutter/material.dart';

import 'Message.dart';
import 'MyHome.dart';
import 'Noti.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        // 메뉴를 선책했을때 함수
        onDestinationSelected: (index){
          setState(() {
            currentPageIndex = index;
          });
        },
        // 선택되었을때 바탕색
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        // 아래쪽 메뉴
        destinations: [
          NavigationDestination(
              // 선택되었을때 아이콘
              selectedIcon: Icon(Icons.home),
              // 선택되지 않았을때 아이콘
              icon: Icon(Icons.home_outlined),
              label: '홈',
          ),
          NavigationDestination(
            icon:Badge(
              child: Icon(Icons.notifications_sharp),
              label: Text('2'),
            ),
            label: '알림',
          ),
          NavigationDestination(
            // 선택되지 않았을때 아이콘
            icon: Badge(
              child: Icon(Icons.message_sharp),
              label: Text('3'),
            ),
            label: '대화방',
          ),
        ],
      ),

      body: <Widget>[
        MyHome(),
        Noti(),
        Message(),
      ][currentPageIndex],

    );
  }
}
