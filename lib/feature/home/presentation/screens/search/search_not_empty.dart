import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app2/feature/favorites/domain/entities/favorite_entity.dart';
import 'package:my_app2/feature/favorites/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:my_app2/feature/favorites/presentation/bloc/favorite_bloc/favorite_event.dart';
import 'package:my_app2/feature/favorites/presentation/bloc/favorite_bloc/favorite_state.dart';
import 'package:my_app2/feature/home/domain/entities/product_entity.dart';

class SearchNotEmpty extends StatelessWidget {
  final List<ProductEntity>? products;
  const SearchNotEmpty([this.products]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                mainAxisExtent: 280,
              ),
              itemBuilder: (context, index) {
                final product = products![index];

                return GestureDetector(
                  onTap: () {
                    context.push('/product', extra: product);
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 170,
                            height: 200,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blueGrey,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => const Center(
                                    child: Icon(Icons.broken_image, size: 50),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: BlocBuilder<FavoriteBloc, FavoriteState>(
                              builder: (context, state) {
                                bool isFav = false;
                                if (state is FavoriteLoaded) {
                                  isFav = state.favorite.any(
                                    (e) => e.id == product.id,
                                  );
                                }
                                return ScaleTap(
                                  scaleMinValue: 2,
                                  opacityMinValue: 0.5,
                                  duration: Duration(milliseconds: 500),
                                  onPressed: () {
                                    if (isFav) {
                                      context.read<FavoriteBloc>().add(
                                        FavoriteRemove(product.id),
                                      );
                                    } else {
                                      context.read<FavoriteBloc>().add(
                                        FavoriteAdd(
                                          FavoriteEntity.fromProductModel(
                                            product,
                                          ),
                                        ),
                                      );
                                    }
                                  },

                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withAlpha(80),
                                      ),
                                      child: isFav
                                          ? Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 20,
                                            )
                                          : Icon(
                                              Icons.favorite_border_rounded,
                                              color: Colors.white70,
                                              size: 20,
                                            ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 130,
                        child: Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        product.sellerName,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
