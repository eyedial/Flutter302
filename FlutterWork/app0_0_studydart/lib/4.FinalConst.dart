void main(){
  // final 과 const는 일단 선언을 하게 되면 바꿀수 없다
  // const는 컴파일 할때 정해지고 final은 런타임(실행)시 정해진다
  final int max = 100;
  const int min = 1;

  // max = 50;
  // min = 20;

  // DateTime() 은 런타임때 그시간을 가져온다
  //const DateTime now = DateTime.now();
  final DateTime now = DateTime.now();



}