import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

import '../service/DirectionService.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // 지도에 처음 보여줄 위치 : 소마고
  final NLatLng myLocation = NLatLng(35.1428293, 126.8002187);
  // 다른 한곳의 위치를 지정한다
  final NLatLng otherLocation = NLatLng(35.1468016, 126.8405088);

  late NaverMapController mapController;

  // 경로를 받을 리스트를 만든다
  List<NLatLng> path = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NaverMap(
        // 지도의 속성을 설정
        options: const NaverMapViewOptions(
          initialCameraPosition: NCameraPosition(
            // 처음 지도를 보여줄 위치 : 위도, 경도 > NLatLng(위도, 경도)
            // 구글 지도를 띄워서 원하는 위치 클릭후 주소줄에 위도,경도 찾음
            target: NLatLng(35.1428293, 126.8002187),
            // 처음 지도를 보여줄 때 얼마만큼의 크기로 보여줄것인가
            // 숫자가 크면 클수록 자세히 보여준다
            zoom: 15,
            // 마찰계수 : 매끄럽게, 조금 움직여도 반응
            bearing: 0,
            // 카메라를 고정시킨 상태에서 위 아래로 움직이게 하는 정도
            tilt: 0,
          ),
          // 지도를 넓게 보거나 자세히 볼수있게 하는 것
          zoomGesturesEnable: true,
          // 지도 유형
          mapType: NMapType.basic,
          activeLayerGroups: [
            // 건물주소, 입구, 이름
            NLayerGroup.building,
            // 대중교통
            NLayerGroup.transit,
          ],
          // 언어지정
          locale: Locale('kr'),
        ),

        //지도 로딩이 다 되어 보여줄 준비가 끝났을때
        onMapReady: (controller){
          mapController = controller;
          print('네이버 맵 로딩됨 !!!');
          
          // 마커를 찍어보자
          final markerMyLoc = NMarker(
            id: '1', 
            position: myLocation,
          );
          // 컨트롤러에 오버레이를 추가해 줘야 지도에 나타난다
          controller.addOverlay(markerMyLoc);
          // 마커에 정보창을 띄울수 있다
          final onMarkerInfoWindow = NInfoWindow.onMarker(
            id: markerMyLoc.info.id,
            text: '꺾이지 않은 마음',
          );
          // 정보창을 마커에 붙인다
          markerMyLoc.openInfoWindow(onMarkerInfoWindow);

          // 두 지점사이의 거리 구하기 > double => int
          int distance = myLocation.distanceTo(otherLocation).round();

          // 두번째 마커를 만든다
          final markerOther = NMarker(id: '2', position: otherLocation);
          controller.addOverlay(markerOther);

          final onMarkerInfoWin2 = NInfoWindow.onMarker(
            id: markerOther.info.id,
            text: '거리: $distance m',
          );
          // 정보창을 마커에 붙인다
          markerOther.openInfoWindow(onMarkerInfoWin2);
        },

        // 지도를 클릭했을때 : 클릭한 화면위치정보, 지도 좌표상의 위치
        onMapTapped: (point, latlng){
          print('============================= latlng');
          print('latitude: ${latlng.latitude},\nlongitude: ${latlng.longitude}');
          print('pointX: ${point.x},\npointY: ${point.y}');
        },

      ),

      // 플로팅 액션 버튼 로딩
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 경로 가져오기
          path = await fetchPath(myLocation, otherLocation);
          print('============================ path');
          print(path);
          /*setState(() {
            path;
          });*/
          // 경로 리스트를 화면에 그려야 한다
          NPathOverlay pathOverlay = NPathOverlay(
            id: "test",
            coords: path,
            color: Colors.blue,
            width: 4,
          );
          // 반드시 mapController에 오버레이를 추가해야 한다
          mapController.addOverlay(pathOverlay);

        },
        child: Icon(Icons.location_on),
      ),
      // 플로팅 액션 버튼 위치 조절
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}
