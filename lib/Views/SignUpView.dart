import 'package:flutter/material.dart';
import 'widgets/customTextField.dart';

class SignUpView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Sign Up"),backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Create your new account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            CustomTextField(
              labelText: "Email Address",
              controller: emailController,
            ),
            SizedBox(height: 30),
            CustomTextField(
              labelText: "User Name",
              controller: usernameController,
            ),
            SizedBox(height: 30),
            CustomTextField(
              labelText: "Password",
              isPassword: true,
              controller: passwordController,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "I Agree with ",
                      children: [
                        TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text("Register", style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign In",
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
