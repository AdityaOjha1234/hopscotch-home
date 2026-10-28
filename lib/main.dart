import 'dart:ui' show PointerDeviceKind;

import 'package:flutter/material.dart';

import 'home_page.dart';
import 'theme.dart';

void main() => runApp(const HopscotchApp());

class HopscotchApp extends StatelessWidget {
  const HopscotchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hopscotch - Home',
      debugShowCheckedModeBanner: false,
      // Lets horizontal lists be dragged with a mouse on web/desktop.
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}
