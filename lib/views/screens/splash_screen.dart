import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: const [
          // Image.network(
          //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKLyoXrVOpJ4pULPcDZXJNvf3WIIt4le0YIw&usqp=CAU"),
          Text("E-Commerce App"),
        ],
      ),
      nextScreen: HomePage(),
      duration: 3000,
    );
  }
}
