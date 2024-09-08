import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// 경로 알아오기 : [[longitude, latitude],[longitude, latitude], ...] > NLatLng(latitude, longitude)
Future<List<NLatLng>> fetchPath(NLatLng startLoc, NLatLng endLoc) async{
  List<NLatLng> path = [];

  // url을 https://api.ncloud-docs.com/docs/ai-naver-mapsdirections15 에서 가져와 쓴다
  final response = await http.get(
    Uri.parse('https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving'
        '?start=${startLoc.longitude},${startLoc.latitude}'
        '&goal=${endLoc.longitude},${endLoc.latitude}'),
    headers: {
      'X-NCP-APIGW-API-KEY-ID': 'fhwc04ibwb',
      'X-NCP-APIGW-API-KEY': 'liOwN0S1J9SJTI2qk7eHiHr2af7rdXd1fTyTgDQH'
    }
  );
  // 응답이 에러가 아니라 정상이라면 : 200 > 정상
  if(response.statusCode == 200){
    // 응답 : 한글이 깨져서 아래와 같이 받음
    final data = json.decode(utf8.decode(response.bodyBytes));
    print('======================== response data');
    print(data);
    // 받은 응답에서 경로(path)만 분리함
    final route = data['route']['traoptimal'][0]['path'] as List<dynamic>;
    print('======================== route ');
    print(route);
    // path 형태 [longitude, latitude] > NLatLng(latitude, longitude)
    path = route.map((e) => NLatLng(e[1], e[0])).toList();
    print('==================== path: ${path.length}');
    print(path);

  }else{
    throw Exception('Failed to load path');
  }

  return path;
}