class ProductDetailModelNew {
  String? id;
  String? name;
  String? category;
  String? brand;
  double? price;
  String? description;
  String? shopName;
  List<String>? images;
  double? rating;
  double? discount;
  CreatedBy? createdBy;
  bool? isDeleted;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? quantityComments;
  int? quantityProductPurchased;
  int? quantity;

  ProductDetailModelNew({
    this.id,
    this.name,
    this.category,
    this.brand,
    this.price,
    this.description,
    this.shopName,
    this.images,
    this.rating,
    this.discount,
    this.createdBy,
    this.isDeleted,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.quantityComments,
    this.quantityProductPurchased,
    this.quantity,
  });

  // Tạo model từ JSON
  factory ProductDetailModelNew.fromJson(Map<String, dynamic> json) {
    return ProductDetailModelNew(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      brand: json['brand'],
      price: json['price']?.toDouble(),
      description: json['description'],
      shopName: json['shopName'],
      images: List<String>.from(json['images'] ?? []),
      rating: json['rating']?.toDouble(),
      discount: json['discount']?.toDouble(),
      createdBy: json['createdBy'] != null
          ? CreatedBy.fromJson(json['createdBy'])
          : null,
      isDeleted: json['isDeleted'],
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      quantityComments: json['quantityComments'],
      quantityProductPurchased: json['quantityProductPurchased'],
      quantity: json['quantity'],
    );
  }

  // Chuyển model sang JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'category': category,
      'brand': brand,
      'price': price,
      'description': description,
      'shopName': shopName,
      'images': images,
      'rating': rating,
      'discount': discount,
      'createdBy': createdBy?.toJson(),
      'isDeleted': isDeleted,
      'deletedAt': deletedAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'quantityComments': quantityComments,
      'quantityProductPurchased': quantityProductPurchased,
      'quantity': quantity,
    };
  }
}

class CreatedBy {
  String? id;
  String? email;

  CreatedBy({this.id, this.email});

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      id: json['_id'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
    };
  }
}
