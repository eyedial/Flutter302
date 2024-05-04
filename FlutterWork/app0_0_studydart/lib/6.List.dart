// List<타입> : [] 여러값을 하나의 변수에 저장할 수 있는 타입 > List, Map, Set
// 컬렉션: 자바 > arrayList
void main(){
  List<String> muhan = ['aaa', 'bbb', 'ccc'];
  List<int> nums = [1,2,3,];

  // 요소에 접근 : 인덱스 사용 > 0 부터 시잓
  print(muhan[0]);
  print(muhan[1]);
  print(muhan[2]);
  // print(muhan[3]); 인덱스 에러

  // 리스트 길이 알아보기 : length
  print(muhan.length);
  // 리스트 마지막에 추가 : add, addAll
  muhan.add('ddd');
  print(muhan);
  muhan.addAll(['eee', 'fff']);
  print(muhan);
  // 지우기 : remove, removeAt(index)
  muhan.remove('aaa');
  print(muhan);
  muhan.removeAt(1);
  print(muhan);
  // 인덱스 알아보기
  print(muhan.indexOf('fff'));
  muhan.add('bbb');
  print(muhan);

}