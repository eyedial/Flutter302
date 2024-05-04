void main(){
  int num1 = 20, num2 = 10;

  print(num1 + num2);
  print(num1 - num2);
  print(num1 * num2);
  print(num1 / num2);
  print(num1 % num2);  // 나머지

  print('------------------------');
  // 변수값이 변하는 연산자
  // 후위연산자
  num1++;   // num1 = num1 + 1;
  print(num1);

  // 전위연산자
  ++num1;    // num1 = num1 + 1;
  print(num1);

  --num1;    // num1 = num1 - 1;
  print(num1);

  num2 += 3;  // num2 = num2 + 3;
  print(num2);

  double? dnum1 = 3.3;
  print(dnum1);
  dnum1 ??= 5.5;
  print(dnum1);
  dnum1 = null;
  // ??= 는 만약에 그변수값이 null이라면 오른쪽값을 넣어라
  dnum1 ??= 5.5;
  print(dnum1);

  // 비교연산자
  int num3 = 1, num4 = 2;
  // bool값으로 치환
  print(num3 > num4);
  print(num3 < num4);
  print(num3 >= num4);
  print(num3 <= num4);
  print(num3 == num4);
  print(num3 != num4);

  // 타입비교
  print(num3 is int);
  print(num3 is String);
  print(num3 is! int);
  print(num3 is! String);

  // 논리 연산자 : && > 둘다 참일때 참, || > 하나라도 참이면 참
  bool result = (12 > 10) && (1 > 0);
  print(result);
  result = (12 > 10) && (1 < 0);
  print(result);
  result = (12 < 10) || (1 > 0);
  print(result);
  result = (12 < 10) || (1 < 0);
  print(result);

}