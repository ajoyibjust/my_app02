import 'package:my_app2/feature/home/domain/entities/product_entity.dart';

class FavoriteEntity {
  final String id;
  final String title;
  final double price;
  final String image;
  final double rating;
  final String description;
  final String sellerName;

  FavoriteEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.description,
    required this.sellerName,
  });

  factory FavoriteEntity.fromJson(Map<dynamic, dynamic> json) {
    return FavoriteEntity(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
      rating: json['rating'],
      description: json['description'],
      sellerName: json['sellerName'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image,
      'rating': rating,
      'description': description,
      'sellerName': sellerName,
    };
  }

    factory FavoriteEntity.fromProductModel(ProductEntity model) {
    return FavoriteEntity(
      id: model.id,
      title: model.title,
      price: model.price,
      image: model.image,
      rating: model.rating,
      description: model.description,
      sellerName: model.sellerName,
    );
  }
}
