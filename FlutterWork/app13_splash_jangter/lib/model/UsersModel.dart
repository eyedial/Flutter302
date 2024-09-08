// 사용자 모델 - 사용자 DTO : 데이터베이스에 저장하거나 데이터를 가져올때
class UsersModel {
  String user_id;
  String user_pw;
  String? user_name;
  String? user_profile;
  String created_at;

  // 생성자 - 클래스를 생성할때 사용
  UsersModel(this.user_id, this.user_pw, this.user_name,
      this.user_profile, this.created_at);

  // 매소드를 만들수도 있다 - 내용 출력하는것
  String? toPrint() {
    print('$user_id, $user_pw, $user_name, '
        '$user_profile, $created_at');
  }
  // 통신상에서 주고 받는 데이터 형태 : xml, json
  // json형태에서 클래스에 넣어서 객체를 만들어주는 것
  UsersModel.fromJson(Map<String, dynamic> json)
    : user_id = json['user_id'],
      user_pw = json['user_pw'],
      user_name = json['user_name'],
      user_profile = json['user_profile'],
      created_at = json['created_at'];

  // Map형태의 것을 json형태로 변환
  Map<String, dynamic> toJson() => {
    'user_id' : user_id,
    'user_pw' : user_pw,
    'user_name' : user_name,
    'user_profile' : user_profile,
    'created_at' : created_at,
  };


}