

void main(){
  showData();
}

void showData() async {
  startTask();
  String? info2 = await accessData();
  fetchData(info2);
}

void startTask(){
  String info1 = '요청수행 시작';
  print(info1);
}

Future<String?> accessData() async{
  // 비동기
  String? info2;
  await Future.delayed(Duration(seconds: 3), (){
    info2 = '데이터240';
    print(info2);
  });
  return info2;
}

void fetchData(info2){
  String info3 = '$info2 추출';
  print(info3);
}
