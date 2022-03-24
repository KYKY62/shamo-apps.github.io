class UserModel {
  late int id;
  late String name;
  late String username;
  late String email;
  late String profilephotourl;
  late String token;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.profilephotourl,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    profilephotourl = json['profile_photo_ur'];
    token = json['token'];
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_photo_ur': profilephotourl,
      'token': token,
    };
  }
}
