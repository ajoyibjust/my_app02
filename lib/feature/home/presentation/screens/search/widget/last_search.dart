import 'package:flutter/material.dart';

class LastSearch extends StatelessWidget {
  const LastSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Electronics", style: TextStyle(color:  Colors.grey),),
          Icon(Icons.close, color: Colors.grey),
        ],
      ),
    );
  }
}
