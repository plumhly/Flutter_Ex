import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintRoute extends StatelessWidget {
  const CustomPaintRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300),
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);
      canvas.drawRect(Offset.zero & size, paint);

    //画棋盘
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 15; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画棋子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
      
    canvas.drawCircle( Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2), min(eWidth / 2, eHeight / 2) - 2, paint);


    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}