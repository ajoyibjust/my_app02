import 'package:flutter/material.dart';

Widget spot(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 10 : 6,
      height: isActive ? 10 : 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.indigoAccent : Colors.grey[300],
        shape: BoxShape.circle,
      ),
    );
  }