void main(){
  Car sonata = Car('SONATA', ['방탄거울, 방탄타이어']);
  sonata.sayName();
  sonata.sayOption();

}

class Car{
  String carName;
  List<String> carOption;

  // 생성자 > 기본
  /*Car(String carName, List<String> carOption)
    : this.carName = carName, this.carOption = carOption;*/
  // 생성자 > 간소화
  Car(this.carName, this.carOption);

  sayName(){
    print('저는 $carName입니다');
  }

  sayOption(){
    print('저의 옵션은 $carOption 입니다');
  }


}