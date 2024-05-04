void main(){
  // loop : 반복적인 일을 처리할때 유용 예) 1~100 출력
  // for(초기화식; 조건식; 증감식){ } 형태
  for(int i=0; i<10; i++){
    print('이번에 출력할 숫자는 ${i+1}번 입니다');
  }

  // 리스트에 있는 값을 모두 더해보자
  List<int> nums = [1, 2, 3, 4, 5, 6];
  int total = 0;
  for(int i=0; i<nums.length; i++){
    if(i==3){
      break;
      //continue;
    }
    total += nums[i];
  }
  print(total);

  total = 0;
  // 향상된 for문
  for(int num in nums){
    total += num;
  }
  print(total);

  Map<String, String> muhan = {
    '가':'aaa',
    '나':'bbb',
    '다':'ccc',
  };

  for(String str in muhan.keys){
    if(muhan[str] == 'bbb'){
      print('bbb를 찾았습니다');
      break;
    }
  }

}