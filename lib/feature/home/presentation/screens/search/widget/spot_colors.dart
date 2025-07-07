import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app2/feature/home/presentation/provider/color_provider.dart';

class SpotColors extends StatelessWidget {
  const SpotColors({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.black,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.teal,
    ];

    final colorProvider = context.watch<ColorProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(colors.length, (index) {
        final isSelected = colorProvider.selectedIndex == index;

        return GestureDetector(
          onTap: () {
            context.read<ColorProvider>().selectColor(index);
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: colors[index],
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : null,
          ),
        );
      }),
    );
  }
}
