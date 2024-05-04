// Set : List 거의 같습니다. 중복을 제거해 준다
void main(){
  final Set<String> names = {
    'aaa', 'bbb', 'ccc'
  };

  print(names);
  names.add('ddd');
  print(names);
  names.remove('ddd');
  print(names);
  names.add('aaa');
  print(names);
  print(names.contains('aaa'));


}