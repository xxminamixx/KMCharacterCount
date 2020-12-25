import 'package:flutter/material.dart';
import 'package:km_character_count/Utility/Screen.dart';
import 'package:km_character_count/Widget/HomeWidget.dart';

void main() {
  runApp(KMCharacterCount());
}

class KMCharacterCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '文字数カウンター',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeWidget(),
    );
  }
}
