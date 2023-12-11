import 'package:flutter/material.dart';

class TestUtils {
  const TestUtils._();

  static Widget buildTestMaterialApp(Widget child) {
    return MaterialApp(
      title: 'Golden Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Murecho',
      ),
      debugShowCheckedModeBanner: false,
      home: Material(child: child),
    );
  }
}
