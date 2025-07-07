import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app2/core/extension/sizedbox_extension.dart';
import 'package:my_app2/feature/home/presentation/provider/home_switch_screen.dart';
import 'package:my_app2/feature/home/presentation/widgets/category.dart';
import 'package:my_app2/feature/home/presentation/widgets/home_body.dart';

class HomeCategorySwitcher extends StatefulWidget {
  const HomeCategorySwitcher({super.key});

  @override
  State<HomeCategorySwitcher> createState() => _HomeCategorySwitcherState();
}

class _HomeCategorySwitcherState extends State<HomeCategorySwitcher> {
  @override
  Widget build(BuildContext context) {
    final switchScreen = context.watch<HomeTabProvider>();
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Stack(
            children: [
              Align(
                alignment: Alignment(-0.5, -1),
                child: GestureDetector(
                  onTap: () {
                    switchScreen.changeTab(0);
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: switchScreen.index == 0
                          ? Colors.deepPurple
                          : Colors.black54,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.5, -1),
                child: GestureDetector(
                  onTap: () {
                    switchScreen.changeTab(1);
                  },
                  child: Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: switchScreen.index == 1
                          ? Colors.deepPurple
                          : Colors.black54,
                    ),
                  ),
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: switchScreen.index == 0
                    ? Alignment(-0.6, 1)
                    : Alignment(0.6, 1),
                child: SizedBox(
                  width: 100,
                  height: 2,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        15.height,
        switchScreen.index == 0 ? HomeBody() : Category(),
      ],
    );
  }
}
