void main(){
  Car hynudai = Car(carMaker: 'HYUNDAI', typeCount: 5);
  hynudai.sayMaker();
  hynudai.sayTypeCount();

  HyunDai hyunDai2 = HyunDai(
      carMaker: 'HYUNDAI',
      typeCount: 5,
      carName: 'SONSTA'
  );
  hyunDai2.sayMaker();
  hyunDai2.sayTypeCount();
  hyunDai2.sayCarName();

}

class Car{
  String carMaker;  // 차만든 회사
  int typeCount;   // 차종갯수
  // 네임드 생성자
  Car({
    required this.carMaker,
    required this.typeCount,
  });

  void sayMaker(){
    print('저는 ${this.carMaker}입니다');
  }

  void sayTypeCount(){
    print('${this.carMaker}는 ${this.typeCount}개의 차종을 생산합니다');
  }

}

// 상속 : 부모에게 받은 모든것을 사용할 수 있다
class HyunDai extends Car {
  String carName;

  HyunDai({
    required super.carMaker,
    required super.typeCount,
    required this.carName,
  });

  sayCarName(){
    print('${super.carMaker}는 ${super.typeCount}의 차종을 만들고 '
        '차 이름은 ${this.carName}입니다');
  }


}