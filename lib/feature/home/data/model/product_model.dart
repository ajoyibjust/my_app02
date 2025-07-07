import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.image,
    required super.rating,
    required super.description,
    required super.sellerName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json, String id) {
    return ProductModel(
      id: id,
      title: json['title'],
      price: json['price'],
      image: json['image'],
      rating: json['rating'],
      description: json['description'],
      sellerName: json['sellerName'],
    );
  }
}
