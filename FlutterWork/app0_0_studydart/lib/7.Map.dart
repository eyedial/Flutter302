// Map<key타입,value타입> : 형태{}, key값 : value값 > 1대1 대응
void main(){
  Map<String, String> muhan = {
    '가':'aaa',
    '나':'bbb',
    '다':'ccc',
  };
  print(muhan);

  Map<int, String> rocker = {
    1 : 'aaa',
    3 : 'bbb',
    4 : 'ccc',
  };

  // 요소에 접근 : 키값으로 접근
  print(muhan['가']);
  print(rocker[1]);

  // 추가
  muhan.addAll({
    '라':'ddd',
    '마':'eee',
  });
  print(muhan);

  // 변경(갱신)하기 :
  muhan['가'] = 'ggg';
  print(muhan);
  // 추가하기
  muhan['바'] = 'fff';
  print(muhan);
  // key 값만 가져오기
  print(muhan.keys);
  // value값만 가져오기
  print(muhan.values);


}