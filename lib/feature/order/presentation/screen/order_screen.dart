import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app2/core/extension/sizedbox_extension.dart';
import 'package:my_app2/feature/order/presentation/widget/order_history_switcher.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 24),
                  Text("My Order"),

                  GestureDetector(
                    onTap: () {
                      context.push("/cart");
                    },
                    child: Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
              30.height,
              OrderHistorySwitcher(),
            ],
          ),
        ),
      ),
    );
  }
}
