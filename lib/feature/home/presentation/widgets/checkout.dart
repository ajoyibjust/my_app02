import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void checkout(BuildContext context) {
  final count = (MediaQuery.sizeOf(context).width - 60) / 15;
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5,
                width: 60,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your promo code',
                  suffixIcon: Icon(Icons.arrow_forward_ios),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              SizedBox(height: 30),
              _price('Subtotal', '\$93.00'),
              SizedBox(height: 10),
              _price('Shipping', '\$6.00'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(count.toInt(), (value) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: SizedBox(
                      width: 5,
                      height: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),
                  );
                }),
              ),
              _price('Total amount', '\$99.00', isTotal: true),
              SizedBox(height: 25),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
               context.push('/payment');
                  },
                  child: Text(
                    'Checkout',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _price(String title, String amount, {bool isTotal = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: isTotal ? 16 : 14,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          color: Colors.grey,
        ),
      ),
      Text(
        amount,
        style: TextStyle(
          fontSize: isTotal ? 16 : 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    ],
  );
}
