import 'package:flutter/material.dart';
import 'package:my_app2/core/extension/sizedbox_extension.dart';
import 'package:my_app2/feature/auth/widgets/show_success_popup.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back),
                    Text("Verification"),
                    24.width,
                  ],
                ),
              ),
              Divider(),
              50.height,
              SizedBox(
                width: 150,
                height: 150,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple[50],
                  ),
                  child: Center(
                    child: Image.network(
                      "https://cdn.prod.website-files.com/65aa03aa3128c50ff756d773/65aa44b6251d38a1fb4d62be_Icon%20(7).png",
                      width: 100,
                    ),
                  ),
                ),
              ),
              30.height,

              Text(
                "Verification Code",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              5.height,
              Text(
                "We have to sent the code verification to",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w500,
                ),
              ),
              5.height,
              Text(
                "magdalena83@mail.com",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  inputCode(_focus1, _focus2),
                  inputCode(_focus2, _focus3),
                  inputCode(_focus3, _focus4),
                  inputCode(_focus4, _focus5),
                  inputCode(_focus5, null),
                ],
              ),

              30.height,
              Padding(
                padding: const EdgeInsets.all(20),
                child: FilledButton(
                  onPressed: () {
                    showSuccessPopup(context);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Submit", style: TextStyle(fontSize: 18)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Resend",
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

FocusNode _focus1 = FocusNode();
FocusNode _focus2 = FocusNode();
FocusNode _focus3 = FocusNode();
FocusNode _focus4 = FocusNode();
FocusNode _focus5 = FocusNode();

Widget inputCode(FocusNode currentFocus, FocusNode? nextFocus) {
  return SizedBox(
    width: 60,
    child: TextField(
      maxLength: 1,
      focusNode: currentFocus,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onChanged: (value) {
        if (value.length == 1 && nextFocus != null) {
          FocusScope.of(currentFocus.context!).requestFocus(nextFocus);
        }
      },
    ),
  );
}
