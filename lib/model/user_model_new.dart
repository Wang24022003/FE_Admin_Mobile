class UserModelNew {
  String? id;
  String? name;
  String? avatar;
  String? email;
  int? age;
  String? gender;
  String? address;
  String? role;
  double? point;
  String? accountType;
  bool? isActive;
  bool? isDeleted;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;


  UserModelNew({
    this.id,
    this.name,
    this.avatar,
    this.email,
    this.age,
    this.gender,
    this.address,
    this.role,
    this.point,
    this.accountType,
    this.isActive,
    this.isDeleted,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  // Khởi tạo từ JSON
  factory UserModelNew.fromJson(Map<String, dynamic> json) {
    return UserModelNew(
      id: json['_id'],
      name: json['name'],
      avatar: json['avatar'],
      email: json['email'],
      age: json['age'],
      gender: json['gender'],
      address: json['address'],
      role: json['role'],
      point: json['point'] != null ? json['point'].toDouble() : null,
      accountType: json['accountType'],
      isActive: json['isActive'],
    );
  }

  // Chuyển đổi sang JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'avatar': avatar,
      'email': email,
      'age': age,
      'gender': gender,
      'address': address,
      'role': role,
      'point': point,
      'accountType': accountType,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'deletedAt': deletedAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
