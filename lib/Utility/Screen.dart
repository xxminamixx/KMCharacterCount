import 'package:flutter/material.dart';

class Screen {

  static Size size;

  Screen(BuildContext context) {
    Screen.size = MediaQuery.of(context).size;
  }

}