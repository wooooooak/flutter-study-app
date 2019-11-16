import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter {
  LoginBackground({@required this.isJoin});

  final bool isJoin;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = isJoin ? Colors.red : Colors.blueAccent;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 5.5), size.height * 0.5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
