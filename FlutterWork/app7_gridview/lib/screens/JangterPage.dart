import '/common/Common.dart';
import '/model/JangterModel.dart';
import '/screens/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JangterPage extends StatefulWidget {
  const JangterPage({super.key});

  @override
  State<JangterPage> createState() => _JangterPageState();
}

class _JangterPageState extends State<JangterPage> {
  // 이미지경로(imgPath), 제목(title), 가격(price), 주소(address)
  // 이미지를 사용하기 위해서는 pubspec.yaml에 사용한다고 알려줘야 함
  List<String> imgPath = [
    'lib/images/1.webp',
    'lib/images/2.webp',
    'lib/images/3.webp',
    'lib/images/4.webp',
    'lib/images/5.webp',
    'lib/images/6.webp',
    'lib/images/7.webp',
    'lib/images/8.webp',
    'lib/images/9.webp',
    'lib/images/10.webp',
  ];
  List<String> title = [
    '스타웃브 꼬꼬떼 팝니다',
    '필요하신 차키 팝니다',
    '바ㅂ오바오 팔아요',
    '엄마가 즉시 빨리 당장 당근에 올리래요',
    '몽클레어 후드집업',
    '신세계 상품권 10만원권 2장',
    '재고정리 18인치 캐리어 새상품',
    '튼튼한 원목의자 벤치의자',
    '오이',
    '아기내복 아기실내복 상하세트',
  ];

  List<String> price = [
    '40,000원',
    '5,000원',
    '5,000원',
    '22,000원',
    '80,000원',
    '150,000원',
    '20,000원',
    '10,000원',
    '15,000원',
    '4,500원',
  ];

  List<String> address = [
    '서울 강남구 대치동',
    '인천 부평구',
    '서울 영등포구',
    '부산 연제구',
    '서울 강남구 대치1동',
    '대구 북구 국우동',
    '광주 광산구 쌍암동',
    '대전 동구 용전동',
    '경기도 양주시 회천4동',
    '강원도 원주시 무실동',
  ];

  List<String> liked = ['5', '3', '1', '2', '0', '5', '2', '7', '9', '2'];

  @override
  Widget build(BuildContext context) {
    // 디테일 페이지로 넘기기 위해 위의 자료를 JangterModel 리스트로 만든다
    final List<JangterModel> jangterModels = List.generate(
        title.length,
        (index) => JangterModel(imgPath[index], title[index], price[index],
            address[index], liked[index]));

    // 각각의 모바일 기종이 달라서 해상도가 다르다 그래서 하드코딩으로
    // 넓이와 높이를 주면 각각의 모양이 다르게 표현된다
    // 따라서 모바일의 기종의 해상도에 따라 위젯의 크기가 알맞게 변경이 되어야
    // 한다 모바일 해상도를 가져와 비율로 크기를 정해주면 된다
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print('width : $width,  height : $height');
    //print(jangterModels);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gridview - 동네장터',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),

      body: GridView.builder(
        // 그리드뷰에 보여질 항목의 갯수
        itemCount: jangterModels.length,
        // 만약 가로로 스크롤을 하게 하고 싶으면
        //
        // 그리드뷰에 대한 설정
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // 가로로 몇개를 배치할 것인가
            crossAxisCount: 2,
            // 가로끼리 얼마나 공간을 띄울것인가
            crossAxisSpacing: 10,
            // 위아래는 얼마나 공간을 띄울것인가
            mainAxisSpacing: 10,
            // Gridview 의 Tile 높이를 얼마나
            mainAxisExtent: 260,
          ),

        itemBuilder: (context, index) {
          // 카드는 그림자 효과가 있으면서 떠 있는 느낌
          return Card(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // 이미지를 클릭하면 팝업창이 뜨게 한다
                    Common.showPopup(
                      context,
                      jangterModels[index].title,
                      jangterModels[index].imgPath,
                      jangterModels[index].price,
                      jangterModels[index].address,
                      jangterModels[index].liked,
                    );
                  },
                  child: Container(
                    width: width * 0.35,
                    height: width * 0.35,
                    child: Image(
                      image: AssetImage(jangterModels[index].imgPath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // 제목이 너무 길어 오버플로우 에러가 나면 그 내용을 둘러싸고
                // 있는곳에 Expanded를 감싸준다
                // Expanded나 Flexable 경우는 children을 가지는 위젯안에서만 가능
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      // 이미지 이외의 것을 누르면  자세한 페이지로 이동한다
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => DetailPage(jangterModel: jangterModels[index])
                      ));
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 15,),
                          Text(
                            jangterModels[index].title,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            jangterModels[index].price,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            jangterModels[index].address,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
