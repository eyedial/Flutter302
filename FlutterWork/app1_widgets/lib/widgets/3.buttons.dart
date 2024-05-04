import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Widget'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                onPressed: () {
                  print("텍스트 버튼이 눌렸어요");
                },
                onLongPress: () {
                  print('텍스트 버튼이 오래 눌렸어요');
                },
                child: Text(
                  '텍스트 버튼',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.amber,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text(
                      '스낵바를 보여 주었습니다 !!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.teal,
                    duration: Duration(seconds: 5),
                  );
                  // 스낵바 보여주기

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  '스낵바를 띄워 주겠습니다',
                  style: TextStyle(
                    height: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {
                  print('토스트 버튼이 눌렸어요!!');
                  // 토스트를 띄울려면 외부라이브러리를 가져와야 한다
                  // pub.dev > flutter toast :
                  // 환경설정을 할때는 pubspec.yaml 안에다 한다
                  buildShowToast('토스트 버튼이 눌렸어요');
                },
                child: Text(
                  '토스트 띄움',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              // 아이콘이 있는 버튼
              TextButton.icon(
                onPressed: () {
                  print('text button clicked');
                },
                label: const Text(
                  'text2 버튼',
                  style: TextStyle(
                    height: 2,
                  ),
                ),
                icon: const Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.amber,
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.black,
                  minimumSize: const Size(200, 10),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              TextButton.icon(
                onPressed: null,
                label: const Text(
                  'text2 버튼',
                  style: TextStyle(
                    height: 2,
                  ),
                ),
                icon: const Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.amber,
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  minimumSize: const Size(200, 10),
                ),
              ),

              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonPadding: EdgeInsets.all(10),
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Text Button'),
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text('Elev Button'),
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text('Elev Button'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void buildShowToast(String mesg) {
    Fluttertoast.showToast(
        msg: mesg,
        gravity: ToastGravity.BOTTOM,
        fontSize: 20,
        backgroundColor: Colors.blueAccent,
        toastLength: Toast.LENGTH_LONG);
  }
}
