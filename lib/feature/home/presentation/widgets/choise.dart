
import 'package:flutter/material.dart';

class Choise extends StatefulWidget {
  const Choise({super.key});

  @override
  State<Choise> createState() => _ChoiseState();
}

class _ChoiseState extends State<Choise> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: SizedBox(
        width: 25,
        height: 25,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isSelected ? Colors.green : Colors.white,
            border: Border.all(color: Colors.blueGrey),
          ),
          child: isSelected
              ? Icon(Icons.check, size: 18, color: Colors.white)
              : null,
        ),
      ),
    );
  }
}
