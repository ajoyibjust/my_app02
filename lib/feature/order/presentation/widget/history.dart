import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app2/core/extension/sizedbox_extension.dart';
import 'package:my_app2/core/utils/size_utils.dart';
import 'package:my_app2/feature/home/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:my_app2/feature/home/presentation/blocs/product_bloc/product_state.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              final products = state.products;

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,

                itemBuilder: (context, index) {
                  final product = products[index];

                  return Container(
                    width: screenWidth(context),
                    height: screenHeight(context) * 0.2,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(10),
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            10.width,
                            SizedBox(
                              width: screenWidth(context) * 0.35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.title, maxLines: 2),
                                  Row(
                                    children: [Text("color: "), Text("Black")],
                                  ),
                                  Text("Qty: 1"),
                                ],
                              ),
                            ),
                            Spacer(),
                            Column(
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      "Completed",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                15.height,
                                Text(
                                  "\$ ${product.price}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          spacing: 15,
                          children: [
                            SizedBox(
                              width: screenWidth(context) * 0.4,
                              height: 45,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(child: Text("Detail")),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth(context) * 0.4,
                              height: 45,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color.fromARGB(255, 93, 81, 198),
                                ),
                                child: Center(
                                  child: Text(
                                    "Received Order",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => 15.height,
              );
            } else if (state is ProductError) {
              return Center(child: Text("Xatolik: ${state.message}"));
            }
            return const Center(child: Text("Mahsulotlar yo'q"));
          },
        ),
      ],
    );
  }
}
