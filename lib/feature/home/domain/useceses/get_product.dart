import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<ProductEntity>> call() {
    return repository.getProducts();
  }
}
