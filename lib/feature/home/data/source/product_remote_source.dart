import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app2/feature/home/data/model/product_model.dart';

class ProductRemoteDataSource {
  final FirebaseFirestore firestore;

  ProductRemoteDataSource(this.firestore);

  Future<List<ProductModel>> getProducts() async {
    final snapshot = await firestore.collection('products').get();
    return snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data(), doc.id))
        .toList();
  }
}
