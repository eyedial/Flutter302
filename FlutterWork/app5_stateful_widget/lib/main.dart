import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyPage(),
    );
  }
}

// stateless 위젯은 화면 갱신(빌트)를 하더라도 새로운 데이터의 변경이 없으므로
// 그냥 다시 화면변경된 부분만 갱신하여 화면을 보여주면 된다
// 그러나 statefulWidget은 화면을 갱신하면 변화된 데이터가 있는지 확인을
// 해야 하는데 State라는 것으로 statefulWidget을 감싸서 변화된 데이터를
// State라는것으로 추적하여 갱신할때 그 갱신된 데이터 부분만 확인하여 갱신한다
class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

// _ 가 쓰인 변수나 클래스는 접근제어자가 privite 형태라고 생각하면 된다
class _MyPageState extends State<MyPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushjed\nthe butons this many times',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '$counter',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: (){
                    /*counter++;
                    print(counter);*/
                    setState(() {
                      counter++;
                      print(counter);
                    });
                  },
                  child: Icon(Icons.add),
                  foregroundColor: Colors.amberAccent,
                  backgroundColor: Colors.green,
                ),
                SizedBox(width: 30,),
                FloatingActionButton(
                  onPressed: (){
                    setState(() {
                      counter--;
                      print(counter);
                    });
                  },
                  child: Icon(Icons.remove),
                  foregroundColor: Colors.amberAccent,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
