import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Views/MainTabBarView.dart';
import 'Views/LoginView.dart';
import 'Views/SignUpView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:prova/ViewModels/TabBarViewModel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => TabBarViewModel()), // ✅ Provider eklendi
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login/Signup Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/login', // ✅ Başlangıç rotası
      routes: {
        '/login': (context) => LoginView(),
        '/signup': (context) => SignUpView(),
        '/homepage': (context) => MainTabBarView(),
      },
    );
  }
}
