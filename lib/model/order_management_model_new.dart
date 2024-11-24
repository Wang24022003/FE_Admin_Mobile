class Address {
  final String province;
  final String district;
  final String ward;
  final String detail;

  Address({
    required this.province,
    required this.district,
    required this.ward,
    required this.detail,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      province: json['province'] ?? '',
      district: json['district'] ?? '',
      ward: json['ward'] ?? '',
      detail: json['detail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'province': province,
      'district': district,
      'ward': ward,
      'detail': detail,
    };
  }
}
class Item {
  final Product product;
  final String name;
  final int quantity;
  final double price;
  final String id;
  final bool isDeleted;
  final DateTime? deletedAt;

  Item({
    required this.product,
    required this.name,
    required this.quantity,
    required this.price,
    required this.id,
    required this.isDeleted,
    this.deletedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      product: Product.fromJson(json['product']),
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      id: json['_id'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'name': name,
      'quantity': quantity,
      'price': price,
      '_id': id,
      'isDeleted': isDeleted,
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}
class CreatedBy {
  final String id;
  final String email;

  CreatedBy({
    required this.id,
    required this.email,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      id: json['_id'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
    };
  }
}
class Product {
  final String id;
  final List<String> images;

  Product({
    required this.id,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String,
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'images': images,
    };
  }
}

class OrderModelNew {
  final String id;
  final String user;
  final Address address;
  final List<Item> items;
  final List<String> coupons;
  final String supplier;
  final double total;
  final String? notes;
  final CreatedBy createdBy;
  final String statusUser;
  final String statusSupplier;
  final String paymentMethod;
  final bool isCheckout;
  final DateTime? confirmationDate;
  final bool isDeleted;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderModelNew({
    required this.id,
    required this.user,
    required this.address,
    required this.items,
    required this.coupons,
    required this.supplier,
    required this.total,
    this.notes,
    required this.createdBy,
    required this.statusUser,
    required this.statusSupplier,
    required this.paymentMethod,
    required this.isCheckout,
    this.confirmationDate,
    required this.isDeleted,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create OrderModel from JSON
  factory OrderModelNew.fromJson(Map<String, dynamic> json) {
    return OrderModelNew(
      id: json['_id'] ?? '',
      user: json['user'] ?? '',
      address: Address.fromJson(json['address'] ?? {}),
      items: (json['items'] as List)
          .map((item) => Item.fromJson(item as Map<String, dynamic>))
          .toList(),
      coupons: List<String>.from(json['coupons'] ?? []),
      supplier: json['supplier'] ?? '',
      total: (json['total'] ?? 0).toDouble(),
      notes: json['notes'],
      createdBy: CreatedBy.fromJson(json['createdBy'] ?? {}),
      statusUser: json['statusUser'] ?? '',
      statusSupplier: json['statusSupplier'] ?? '',
      paymentMethod: json['paymentMethod'] ?? '',
      isCheckout: json['isCheckout'] ?? false,
      confirmationDate: json['confirmationDate'] != null
          ? DateTime.parse(json['confirmationDate'])
          : null,
      isDeleted: json['isDeleted'] ?? false,
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'])
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  // Method to convert OrderModel to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user,
      'address': address.toJson(),
      'items': items.map((item) => item.toJson()).toList(),
      'coupons': coupons,
      'supplier': supplier,
      'total': total,
      'notes': notes,
      'createdBy': createdBy.toJson(),
      'statusUser': statusUser,
      'statusSupplier': statusSupplier,
      'paymentMethod': paymentMethod,
      'isCheckout': isCheckout,
      'confirmationDate': confirmationDate?.toIso8601String(),
      'isDeleted': isDeleted,
      'deletedAt': deletedAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
