import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app2/core/utils/my_images.dart';
import 'package:my_app2/feature/splash/widgets/spot.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  MyImages.image1,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 40),

              Text(
                'Various Collections Of\nThe Latest Products',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),

              Text(
                'Urna amet, suspendisse ullamcorper ac elit diam\nfacilisis cursus vestibulum.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [spot(true), spot(false), spot(false)],
              ),

              Spacer(),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/onbording2');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 35),

              TextButton(
                onPressed: () {
                  context.go('/login');
                },
                child: Text(
                  'Already Have an Account',
                  style: TextStyle(
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
