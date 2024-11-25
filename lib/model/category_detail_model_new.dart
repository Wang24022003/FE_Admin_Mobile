import 'dart:ui';

class CategoryDetailModelNew {
  String? id;
  String? name;
  String? imageUrl;
  bool isDeleted;
  DateTime? deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String? createdBy;

  CategoryDetailModelNew({
    this.id,
    this.name,
    this.imageUrl,
    required this.isDeleted,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.createdBy,
  });

  // Tạo model từ JSON
  CategoryDetailModelNew.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        imageUrl = json['url'] as String?,
        isDeleted = json['isDeleted'] ?? false,
        deletedAt = json['deletedAt'] != null
            ? DateTime.parse(json['deletedAt'])
            : null,
        createdAt = DateTime.parse(json['createdAt']),
        updatedAt = DateTime.parse(json['updatedAt']),
        createdBy = (json['createdBy'] != null && json['createdBy'] is Map)
            ? json['createdBy']['email']
            : null;

  // Chuyển model về JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'url': imageUrl,
      'isDeleted': isDeleted,
      'deletedAt': deletedAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}
