import '../../../domain/entities/product_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<ProductEntity> products;
  SearchLoaded(this.products);
}

class SearchEmptyState extends SearchState {}

class SearchNotFaund extends SearchState {}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
