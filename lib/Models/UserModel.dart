
// ignore_for_file: unnecessary_null_comparison

class UserModel {
  late String name;
  late String email;
  late String userId;
  late String pic;

  UserModel({
   required this.name,
   required  this.email,
   required  this.userId,
   required  this.pic,}
     
  );

  UserModel.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    } else {
      name = map["name"];
      email = map["email"];
      userId = map["userId"];
      pic = map["pic"];
    }
  }
  toJson() {
    return {
      "name": name,
      "email": email,
      "userId": userId,
      "pic": pic,
    };
  }
}
