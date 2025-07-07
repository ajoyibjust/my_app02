import 'package:my_app2/feature/home/data/source/product_remote_source.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProductEntity>> getProducts() {
    return remoteDataSource.getProducts();
  }
}
