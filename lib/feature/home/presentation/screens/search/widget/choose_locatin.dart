import 'package:flutter/material.dart';

class ChooseLocatin extends StatefulWidget {
  const ChooseLocatin({super.key});

  @override
  State<ChooseLocatin> createState() => _ChooseLocatinState();
}

class _ChooseLocatinState extends State<ChooseLocatin> {
  final List<String> cities = ['San Diego', 'New York', 'Amsterdam'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(cities.length, (index) {
        final isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? Colors.indigoAccent : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              cities[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.indigoAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }),
    );
  }
}
