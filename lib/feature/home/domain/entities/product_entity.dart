class ProductEntity {
  final String id;
  final String title;
  final double price;
  final String image;
  final double rating;
  final String description;
  final String sellerName;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.description,
    required this.sellerName,
  });
}
