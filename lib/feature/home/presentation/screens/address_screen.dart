import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                     context.pop();
                    },
                    child: Icon(Icons.arrow_back_ios_new_rounded),
                  ),

                  Text(
                    "Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Choose your location",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text("Let's find your unforgettable event. Choose a"),
              Text("location below to get started."),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.grey),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'San Diego, CA',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const Icon(Icons.my_location_outlined, color: Colors.grey),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Select location",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 5),
              selectLocation(
                containerBorderColor: Colors.indigo,
                mapBorderColor: Colors.indigo,
              ),
              selectLocation(),
              selectLocation(),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                  context.push('/address');
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

selectLocation({Color? containerBorderColor, Color? mapBorderColor}) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      border: Border.all(color: containerBorderColor ?? Colors.grey.shade400),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Column(
          spacing: 5,
          children: [
            Text(
              'San Diego, CA',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            Text(
              'San Diego, CA',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Spacer(),
        SizedBox(
          width: 65,
          height: 65,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: mapBorderColor ?? Colors.grey.shade400,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ClipOval(
                child: Image.network(
                  "https://t3.ftcdn.net/jpg/12/48/68/06/360_F_1248680603_BX1oU8ucZfJkVGjlqCqHpQjN8HQlOMFv.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
