//User Model
class UserModel {
  String uid;
  String email;
  String phone;
  String name;
  String photoUrl;

  UserModel({this.uid, this.email, this.name, this.phone, this.photoUrl});

  factory UserModel.fromMap(Map data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      phone: data['phone'],
      name: data['name'],
      photoUrl: data['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "phone": phone,
        "name": name,
        "photoUrl": photoUrl
      };
}
