import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _range = const RangeValues(20, 80);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          values: _range,
          min: 0,
          max: 100,
          activeColor: Colors.deepPurple,
          inactiveColor: Colors.grey[300],
          onChanged: (RangeValues values) {
            setState(() {
              _range = values;
            });
          },
        ),
      ],
    );
  }
}
