import 'package:flutter/material.dart';
import 'package:store_app/Screens/home_screen.dart';
import 'package:store_app/Screens/splash_view.dart';
import 'package:store_app/Screens/update_product_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        UpdateProductScreen.id:(context) => const UpdateProductScreen(),
        SplashScreen.id:(context) => const SplashScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
