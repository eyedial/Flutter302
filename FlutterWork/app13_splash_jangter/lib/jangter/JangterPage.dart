import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/JangterModel.dart';
import '../service/UserService.dart';
import 'DetailPage.dart';


class JangterPage extends StatefulWidget {
  List<JangterModel>? jangterList;

  JangterPage({super.key, required this.jangterList});

  @override
  State<JangterPage> createState() => _JangterPageState();
}


class _JangterPageState extends State<JangterPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '동네장터',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      // ListView와 ListView.builder의 차이점은 리스트뷰는 모든 화면을
      // 불러와서 실행시키기 때문에 한꺼번에 많은 데이터를 불러온다면 앱이
      // 버벅거리거나 한참을 멈춘후에 데이터를 다 가져오면 실행할것이다
      // 하지만 리스트뷰빌터는 일정데이터만 불러와서 보여주기 때문에 효과적이다
      body: ListView.builder(
        itemCount: widget.jangterList!.length,
        itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                  DetailPage(jangterModel: widget.jangterList![index],)),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(3),
            child: Card(
               child: Row(
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width * 0.3,
                     height: MediaQuery.of(context).size.width * 0.3,
                     child: Image(
                       // 이미지 내용이 없을때는 'null'이라는 문자열을 가진다
                       // 'null'일때는 기본이미지, 아닐때는 보유한 이미지
                       image: widget.jangterList![index].imgPath!.contains('null')
                        ? AssetImage('lib/images/guest.png') as ImageProvider
                        : NetworkImage(widget.jangterList![index].imgPath!),
                      fit: BoxFit.fill,
                     ),
                   ),

                   // 글자가 많아 overflow가 날때 ... 으로 만들기 위함
                   // 아무곳이나 쓸수 없고 여러자식을 가지는 위젯에만 가능 : Row, Column
                   Expanded(
                     child: Padding(
                       padding: EdgeInsets.all(10),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             '${widget.jangterList![index].title}',
                             style: TextStyle(
                               fontSize: 18,
                               color: Colors.black
                             ),
                             overflow: TextOverflow.ellipsis,
                           ),
                           SizedBox(height: 10,),
                           Text(
                             '${widget.jangterList![index].price}',
                             style: TextStyle(
                                 fontSize: 18,
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                             ),
                             overflow: TextOverflow.ellipsis,
                           ),
                           SizedBox(height: 10,),
                           Text(
                             '${widget.jangterList![index].address}',
                             style: TextStyle(
                                 fontSize: 18,
                                 color: Colors.black
                             ),
                             overflow: TextOverflow.ellipsis,
                           ),

                         ],
                       ),
                     ),
                   ),

                 ],
               ),
              ),
          ),
        );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        foregroundColor: Colors.amberAccent,
        backgroundColor: Colors.green,
        tooltip: '내 물건 추가하기',
        child: Icon(Icons.add),
      ),
    );
  }
}
