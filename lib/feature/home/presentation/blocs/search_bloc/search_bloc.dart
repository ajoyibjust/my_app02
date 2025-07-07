import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app2/feature/home/domain/useceses/get_product.dart';
import 'package:rxdart/rxdart.dart'; 
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetProducts getProducts;

  SearchBloc(this.getProducts) : super(SearchInitial()) {
    on<SearchText>(
      _onTextChanged,
      transformer: debounceTransformer(Duration(seconds: 1)),
    );
  }

  Future<void> _onTextChanged(SearchText event, Emitter<SearchState> emit) async {
    final query = event.query.trim().toLowerCase();

    if (query.isEmpty) {
      emit(SearchEmptyState());
      return;
    }

    emit(SearchLoading());

    try {
      final allProducts = await getProducts();
      final filtered = allProducts
          .where((product) => product.title.toLowerCase().contains(query))
          .toList();

      if (filtered.isEmpty) {
        emit(SearchNotFaund()); 
      } else {
        emit(SearchLoaded(filtered));
      }
    } catch (e) {
      emit(SearchError("Failed to search products"));
    }
  }
}

EventTransformer<T> debounceTransformer<T>(Duration duration) {
  return (events, mapper) =>
      events.debounceTime(duration).switchMap(mapper);
}
