// if(조건식){참이면 수행}else{거짓이면 수행}
void main(){
  int num = 12;
  if((num % 2) == 0){  // 짝수이면
    print('짝수입니다');
  }else{   // 짝수가 아니면
    print('홀수입니다');
  }

  if((num % 3) == 0){
    print('나머지가 0입니다');
  }else if((num % 3) == 1){
    print('나머지가 1입니다');
  }else{
    print('나머지가 2입니다');
  }

  // switch(식) {case:식에서 나온 종류들  break ... default}
  // if 문과 같은 기능을 한다
  int num2 = 20;
  String name = 'aaa';
  //switch(num2 % 3){
  switch(name){
    case 0:
      print('나머지가 0입니다');
      break;
    case 1:
      print('나머지가 1입니다');
      break;
    case 2:
      print('나머지가 2입니다');
      break;
    default:
      print('숫자가 아닙니다');
      break;
  }



}