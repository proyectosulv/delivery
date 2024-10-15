import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String email;
  String password;
  String name;
  String lastName;
  String phone;
  String image;
  int isAvailable;
  String sessionToken;

  User({
    this.id = 0,
    required this.email,
    required this.password,
    required this.name,
    required this.lastName,
    required this.phone,
    this.image = "",
    this.isAvailable = 1,
    this.sessionToken = "",
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["ID"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        lastName: json["lastName"],
        phone: json["phone"],
        image: json["image"],
        isAvailable: json["is_available"],
        sessionToken: json["session_token"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "email": email,
        "password": password,
        "name": name,
        "lastName": lastName,
        "phone": phone,
        "image": image,
        "is_available": isAvailable,
        "session_token": sessionToken,
      };
}
