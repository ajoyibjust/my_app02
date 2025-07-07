import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app2/core/utils/my_images.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});

  final List<String> images = [MyImages.back];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(autoPlay: true, viewportFraction: 1),

      items: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey[50],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(images[0], width: 100),
              ),
              Positioned(
                top: 20,
                left: 50,
                child: Column(
                  children: [
                    Text(
                      '24% off shipping today',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'on bag purchases',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: SizedBox(
                  width: 110,
                  height: 120,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: Colors.indigo[100],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
