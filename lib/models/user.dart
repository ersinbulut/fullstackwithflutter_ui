class UserResponse {
  bool status;
  String message;
  List<User> data;

  UserResponse({required this.status, required this.message, required this.data});

  UserResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = (json['data'] as List).map((v) => User.fromJson(v)).toList();

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((v) => v.toJson()).toList(),
    };
  }
}

class User {
  int id;
  String fullName;
  String mobileNumber;

  User({required this.id, required this.fullName, required this.mobileNumber});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullName'],
        mobileNumber = json['mobileNumber'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'mobileNumber': mobileNumber,
    };
  }
}
