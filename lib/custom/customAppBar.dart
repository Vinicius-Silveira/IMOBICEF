import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double width, height;

  const CustomAppBar(
      {Key? key,
      required this.padding,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withAlpha(50), width: 2),
      ),
      padding: padding,
      child: Center(child: child),
    );
  }
}
