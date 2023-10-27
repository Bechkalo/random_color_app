import 'package:flutter/material.dart';
import 'package:random_color_app/presentation/view/pages/home_page.dart';

/// This widget is the root of your application.
class MyApp extends StatelessWidget {
  /// A constructor for the MyApp class.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
