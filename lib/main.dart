import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ViewModels/TabBarViewModel.dart';
import 'Views/MainTabBarView.dart';
import 'Views/LoginView.dart';
import 'Views/SignUpView.dart';

void main() {
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
      // ✅ CupertinoApp yerine MaterialApp kullanıldı
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
