import 'package:ecom_cart_app_getx/views/screens/cart_page.dart';
import 'package:ecom_cart_app_getx/views/screens/detail_page.dart';
import 'package:ecom_cart_app_getx/views/screens/home_page.dart';
import 'package:ecom_cart_app_getx/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/home_page',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/cart_page',
          page: () => CartPage(),
        ),
        GetPage(
          name: '/detail_page',
          page: () => DetailPage(),
        ),
      ],
    );
  }
}
