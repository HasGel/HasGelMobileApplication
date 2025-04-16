import 'package:flutter/material.dart';
import 'package:prova/Manager/AuthManager.dart';
import 'package:prova/Manager/DatabaseManager.dart';
import 'package:prova/Model/Place.dart';
import 'package:prova/Views/MainTabBarView.dart';
import 'ForgotPasswordView.dart';
import 'widgets/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prova/Views/HomeView.dart';


class LoginView extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginView>{
  final _auth = AuthManager();
  final _firestore = DataBaseManager();

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
                _signIn();
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
  goToHome(BuildContext context) => Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MainTabBarView()),
  );

  _signIn() async {
    final user =
    await _auth.loginUserWithEmailAndPassword(emailController.text, passwordController.text);
    _deletePlace();
    if (user != null) {
      print("Loggedin succesfully");
      goToHome(context);
    }
  }

  _setPlace() async{
    final Place data = Place(
        id: '1',
        name: 'name',
        location: 'location',
        logoUrl: 'logoUrl',
        openingTime: 'openingTime',
        closingTime: 'closingTime',
        isOpen: true,
        items: [],
        createdAt: DateTime.timestamp(),
        updatedAt:  DateTime.timestamp());

    final place = await _firestore.createPlace(data);
  }

  _deletePlace() async{

    final place = await _firestore.deletePlace(placeID: 'cX5x3TJB905QbBx380SX');
  }

}
