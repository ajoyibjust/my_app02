import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app2/core/extension/sizedbox_extension.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.height,
              Text(
                "Login Account",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              10.height,
              Text(
                "Please login with registered account",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              20.height,
              Text(
                "Email or Phone number",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              15.height,
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter your email or phone number",
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple.shade200,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email yoki telefon raqam kiriting";
                  }
                  return null;
                },
              ),
              20.height,
              Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              15.height,
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Creat your password",
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple.shade200,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Parol kamida 6 xonali bolsin";
                  }
                  return null;
                },
              ),
              15.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              30.height,
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.go('/');
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Sign In", style: TextStyle(fontSize: 18)),
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Or using other method")],
              ),
              20.height,
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 66,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Image.asset("assets/images/google.png", width: 40),
                      Text(
                        "Sign up with Google",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.height,
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 66,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Image.asset("assets/images/facebook.png", width: 50),
                      Text(
                        "Sign up with Facebook",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
