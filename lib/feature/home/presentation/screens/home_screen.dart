import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app2/core/extension/sizedbox_extension.dart';
import 'package:my_app2/core/utils/my_images.dart';
import 'package:my_app2/feature/home/presentation/widgets/home_category_switcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            children: [
              Row(
                spacing: 10,
                children: [
                  ClipOval(child: Image.asset(MyImages.avatar, width: 50)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi Jonathan",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Let's go shopping",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      context.push('/search');
                    },
                    icon: Icon(Icons.search, size: 28),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push('/notification');
                    },
                    child: Icon(Icons.notifications_none, size: 28)),
                ],
              ),

              HomeCategorySwitcher(),
              5.height,
            ],
          ),
        ),
      ),
    );
  }
}
