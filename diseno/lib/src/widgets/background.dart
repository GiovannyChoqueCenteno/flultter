import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Background({Key? key}) : super(key: key);

  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.2, 0.8],
      colors: [
        Color(0xFF2E305F),
        Color(0xFF202333),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Purple Gradiente
        Container(
          decoration: boxDecoration,
        ),
        //PinkBox
        Positioned(
          top: -100,
          left: -40,
          child: _PinkBox(),
        ),
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1)
            ]),
            borderRadius: BorderRadius.circular(80)),
      ),
    );
  }
}
