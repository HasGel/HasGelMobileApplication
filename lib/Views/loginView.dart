import 'package:flutter/material.dart';
import 'ForgotPasswordView.dart';
import 'widgets/customTextField.dart';


class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), backgroundColor: Colors.white,),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Login to your account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              labelText: "Email Address",
              controller: emailController,
            ),
            const SizedBox(height: 30),
            CustomTextField(
              labelText: "Password",
              isPassword: true,
              controller: passwordController,
            ),

            /// Forgot Password yönlendirmesi
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPasswordView()),
                  );
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(color: Color(0xFF00643C)),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// Sign In Butonu
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/homepage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text("Sign In", style: TextStyle(color: Colors.white)),
            ),

            const SizedBox(height: 10),

            /// Register butonu
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Register",
                      style: TextStyle(color: Color(0xFF00643C)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
