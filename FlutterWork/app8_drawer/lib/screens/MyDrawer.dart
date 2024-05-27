import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Drawer'),
        backgroundColor: Colors.green,
        /*leading: IconButton(
            onPressed: (){
              print('메뉴버튼이 눌렸습니다');
            },
            icon: Icon(
              Icons.menu,
            )
        ),*/
        // 앱바 오른쪽 공간에 들어갈 메뉴리스트
        // 아이콘 버튼이나 팝업메뉴 버튼이 들어갈 수 있다
        actions: [
          PopupMenuButton(
              itemBuilder: (context){
                return [
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart),
                          SizedBox(width: 5,),
                          Text('Shopping'),
                        ],
                      ),
                    onTap: (){
                      print('쇼핑카트가 눌렸습니다');
                    },
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 5,),
                        Text('Search'),
                      ],
                    ),
                    onTap: (){
                      print('검색바가 눌렸습니다');
                    },
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(width: 5,),
                        Text('Exit'),
                      ],
                    ),
                    onTap: (){
                      print('종료 버튼이 눌렸습니다');
                    },
                  ),


                ];
              },
          )


          /*IconButton(
            onPressed: (){
              print('쇼핑카트가 눌렸습니다');
            },
            icon: Icon(Icons.shopping_cart),
            color: Colors.red,
          ),
          IconButton(
            onPressed: (){
              print('검색버튼이 눌렸습니다');
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          ),*/

        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              // 드로어 모양과 색깔 지정
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              currentAccountPicture: CircleAvatar(
                // 내부적으로 저장한 이미지
                backgroundImage: AssetImage('lib/images/sinabro.png'),
                // 네트워크상에 있는 이미지 url
                //backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2024/05/12/09/28/brown-bear-8756478_1280.png'),
                // 애니메이션 GIF 파일 이미지
                //backgroundImage: NetworkImage('움짤이 있는 url'),
              ),
              // 다른 사용자 프로필 사진 우측 상단에 표시 여러개 추가 가능
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('lib/images/sinabro2.png'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('lib/images/sinabro2.png'),
                )
              ],

              accountName: Text(
                '시나브로',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              accountEmail: Text(
                'eyedial@naver.com',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              onDetailsPressed: () {
                print('detail button is clicked');
              },
            ),

            // 헤더 아래 메뉴 : leading은 왼쪽레 아이콘, trailing: 오른쪽 아이콘
            ListTile(
              leading: Icon(Icons.home),
              iconColor: Colors.blue,
              focusColor: Colors.green,
              textColor: Colors.black,
              title: Text('홈'),
              onTap: (){
                print('홈 버튼이 눌렸습니다');
              },
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              iconColor: Colors.blue,
              focusColor: Colors.green,
              textColor: Colors.black,
              title: Text('쇼핑'),
              onTap: (){
                print('쇼핑 버튼이 눌렸습니다');
              },
              trailing: Icon(Icons.navigate_next),
            ),


          ],
        ),
      ),
    );
  }
}
