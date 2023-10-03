import 'package:flutter/material.dart';

class Note {
  static const colorDefault = Colors.white;

  static const colorRed = Color(0xFFFFCDD2);

  static const colorOrange = Color(0xFFFFE0B2);

  static const colorYellow = Color(0xFFFFF9C4);

  static const colorLime = Color(0xFFF0F4C3);

  static const colorBlue = Color(0xFFBBDEFB);

  final String title;

  final String body;

  final Color color;

  // {} 안에는 선택적으로 넣을 수 있는 변수
  Note(this.body, {this.title = '', this.color = colorDefault});
}
