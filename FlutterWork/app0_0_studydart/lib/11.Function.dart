void main(){
  addNumbers();
  addNumbersPosi(15, 7, 20);
  addNumPosiOption(12);
  addNumPosiOption(12, 15);
  addNumPosiNamed(child: 7, y: 8, z: 9);
  addNumPosiNamed2(15, y: 7, z:14);
  addNumPosiNamed2(15, y: 7);
}

/// 세개의 숫자를 받아서 모두 더하여 짝수인지 홀수인지 알려주는 함수
/// named Parameter
void addNumPosiNamed2(
  int child,
    {
      required int y,
      int z = 0,
    }){
      print('x:$child, y:$y, z:$z');
      int sum = child + y + z;
      if(sum % 2 == 0){
        print('짝수입니다');
      }else {
        print('홀수입니다');
      }
}

/// 세개의 숫자를 받아서 모두 더하여 짝수인지 홀수인지 알려주는 함수
/// named Parameter
void addNumPosiNamed({
    required int child,
    required int y,
    required int z,
  }){
  print('x:$child, y:$y, z:$z');
  int sum = child + y + z;
  if(sum % 2 == 0){
    print('짝수입니다');
  }else {
    print('홀수입니다');
  }
}

/// 세개의 숫자를 받아서 모두 더하여 짝수인지 홀수인지 알려주는 함수
/// Optional Parameter
void addNumPosiOption(int x, [int y=0, int z=0]){
  print('x:$x, y:$y, z:$z');
  int sum = x+ y + z;
  if(sum % 2 == 0){
    print('짝수입니다');
  }else {
    print('홀수입니다');
  }
}

/// 세개의 숫자를 받아서 모두 더하여 짝수인지 홀수인지 알려주는 함수
/// Positional Parameter
void addNumbersPosi(int x, int y, int z){
  print('x:$x, y:$y, z:$z');
  int sum = x+ y + z;
  if(sum % 2 == 0){
    print('짝수입니다');
  }else {
    print('홀수입니다');
  }
}

// 매소드, 함수
/// 세개의 숫자를 넘겨서 모두 더하여 짝수인지 홀수인지 알려주는 함수
void addNumbers(){
  int x=20, y=10, z=7;
  print('x:$x, y:$y, z:$z');
  int sum = x+ y + z;
  if(sum % 2 == 0){
    print('짝수입니다');
  }else {
    print('홀수입니다');
  }
}