import 'dart:ffi';

void main(){
  // 변수 : 데이터를 담아두는 그릇
  // var : 타입 추론 기능 탑제 > 모든 변수타입을 추론해서 넣는다
  var name = 'BTS';
  print(name.runtimeType);
  var num = 35;
  print(num.runtimeType);
  //name = 20;

  // 변수 타입
  // 정수 : Integer
  int num1 = 10; // '10'
  int num2 = 20;

  // 실수 : double
  double dnum1 = 20.3;
  double dnum2 = 30;


  // 참, 거짓 : bool
  bool isTure = true;
  bool isFalse = false;

  // 문자열 : String
  String str1 = '블랙핑크';
  String str2 = "다크호스";

  // dynamic : 모든 타입으로 변경가능
  dynamic dyName = '김선수';
  print(dyName.runtimeType);
  dyName = 58.3;
  print(dyName.runtimeType);

  // 정수 -> 실수     실수 -> 정수     문자열 -> 정수     문자열 -> 실수
  // 정수.toDouble(), 실수.toInt(),   int.parse(문자열), double.parse(문자열),
  // 정수 -> 문자열    실수 -> 문자열
  // 정수.toString(), 실수.toString()

  print(str1 + ' ' + str2);
  print(str1 + ' ' + num1.toString());
  print(str2 + ' ' + dnum1.toString());

  String str3 = '1234';

  print(int.parse(str3));

  // 문자열 안에 변수를 출력하기
  print('나는 날마다 ${str1}(이)면 좋겠다');
  print('나는 날마다 $str1 $str2(이)면 좋겠다');
  print('나는 날마다 ${str1.length}(이)면 좋겠다');









}