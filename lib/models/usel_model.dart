class UserResponse {
  String? token;
  User? user;
  String? expiration;
  bool? status;
  String? message;

  UserResponse(
      {this.token, this.user, this.expiration, this.status, this.message});

  UserResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    expiration = json['expiration'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['expiration'] = this.expiration;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class User {
  String? id;
  String? fullName;
  String? userName;
  String? role;
   String? profileImage;
  String? deviceToken;
  String? gender;
  String? country;
  int? classroom;
  String? createdAt;

  User(
      {this.id,
      this.fullName,
      this.userName,
      this.role,
      this.deviceToken,
      this.gender,
      this.profileImage,
      this.country,
      this.classroom,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    userName = json['userName'];
     profileImage = json['profileImage'];
    role = json['role'];
    role = json['role'];
    deviceToken = json['deviceToken'];
    gender = json['gender'];
    country = json['country'];
    classroom = json['classroom'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['role'] = this.role;
    data['deviceToken'] = this.deviceToken;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['classroom'] = this.classroom;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
class ResponseRegister {
  final String message;
  final bool status;

  ResponseRegister({required this.message, required this.status});
  factory ResponseRegister.fromJson(Map<String, dynamic> json) {
    return ResponseRegister(message: json["message"], status: json["status"]);
  }
}
