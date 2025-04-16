import 'package:flutter/material.dart';
import 'package:prova/Views/LoginView.dart';
import 'widgets/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prova/Manager/AuthManager.dart';
import 'package:prova/Views/HomeView.dart';
import 'package:prova/Manager/DatabaseManager.dart';



class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _auth = AuthManager();


  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //TO-DO Try to understand what dispose for
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }

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
              onPressed: (){
                _signup();},
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

  _signup() async {
    final result =
    await _auth.createUserWithEmailAndPassword(emailController.text, passwordController.text, usernameController.text);
    if (result.success) {
      print("User Created Succesfully");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
      );
    }
  }
}
