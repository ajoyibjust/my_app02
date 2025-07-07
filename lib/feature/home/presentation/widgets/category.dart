import 'package:flutter/material.dart';
import 'package:my_app2/core/utils/my_images.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueGrey[50],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 26,
                left: index.isOdd ? null : 50,
                right: index.isOdd ? 50 : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bags',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '160 Product',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: index.isEven ? null : 50,
                right: index.isEven ? 50 : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(MyImages.back, width: 70),
                    Image.asset(MyImages.back, width: 60),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 15),
    );
  }
}
