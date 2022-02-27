import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 0),
            )
          ]),
    );
  }
}
