import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app2/feature/favorites/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:my_app2/feature/favorites/presentation/bloc/favorite_bloc/favorite_state.dart';
import 'package:my_app2/feature/favorites/presentation/widgets/favorites_body_grid.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteLoaded) {
                    return FavoriteBodyGrid(state: state.favorite);
                  }
                  return Center(child: Text("Kutulmagan Xatolik"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
