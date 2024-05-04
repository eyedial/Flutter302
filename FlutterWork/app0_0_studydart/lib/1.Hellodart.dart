// 한줄 주석
/*
* 여러줄 주석
*  */
// void : 반환타입(아무것도 없다 > 비어있다)
// main() :  프로그램이 맨 처음 실행되는 진입점
void main(){
  print('Hello Dart');
  print("Hello World");

  print(add(3, 4));
}

// 세개를 사용하면 문서주석으로 인식
/// 더하기 함수
int add(int a, int b){
  return a+b;
}