import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app2/feature/favorites/domain/useceses/add_favorite.dart';
import 'package:my_app2/feature/favorites/domain/useceses/get_favorite.dart';
import 'package:my_app2/feature/favorites/domain/useceses/is_favorite.dart';
import 'package:my_app2/feature/favorites/domain/useceses/remove_favorite.dart';
import 'package:my_app2/feature/favorites/presentation/bloc/favorite_bloc/favorite_event.dart';
import 'package:my_app2/feature/favorites/presentation/bloc/favorite_bloc/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final AddFavorite addFavorite;
  final GetFavorite getFavorite;
  final RemoveFavorite removeFavorite;
  final IsFavorite isFavorite;

  FavoriteBloc({
    required this.addFavorite,
    required this.getFavorite,
    required this.removeFavorite,
    required this.isFavorite,
  }) : super(FavoriteInitial()) {
    on<FavoriteAdd>(_add);
    on<FavoriteGet>(_get);
    on<FavoriteRemove>(_remove);
    on<FavoriteCheck>(_check);
  }
  Future<void> _add(FavoriteAdd event, Emitter<FavoriteState> emit) async {
    await addFavorite(event.product);
    add(FavoriteGet());
  }

  Future<void> _get(FavoriteGet event, Emitter<FavoriteState> emit) async {
    final favorites = await getFavorite();
    emit(FavoriteLoaded(favorites));
  }

  Future<void> _remove(
    FavoriteRemove event,
    Emitter<FavoriteState> emit,
  ) async {
    await removeFavorite(event.id);
    add(FavoriteGet());
  }

  Future<void> _check(FavoriteCheck event, Emitter<FavoriteState> emit) async {
    final res = await isFavorite(event.id);
    emit(FavoriteStatus(res));
  }
}
