import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton(
      {super.key, required this.onTap, required this.goingRightOrLeft, required this.title, required this.size});

  final Function() onTap;
  final bool goingRightOrLeft;
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color(0xFF319997),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: goingRightOrLeft? [
          Text(
            '$title  ',
            style: TextStyle(
                color: Colors.white,
                fontSize: size,
                fontWeight: FontWeight.bold),
          ),
          Text(
            String.fromCharCode(CupertinoIcons.arrow_right.codePoint),
            style: TextStyle(
              inherit: false,
              color: Colors.white,
              fontSize: size,
              fontWeight: FontWeight.w700,
              fontFamily: CupertinoIcons.exclamationmark_circle.fontFamily,
              package: CupertinoIcons.exclamationmark_circle.fontPackage,
            ),
          ),
          ]: [
            Text(
              String.fromCharCode(CupertinoIcons.arrow_left.codePoint),
              style: TextStyle(
                inherit: false,
                color: Colors.white,
                fontSize: size,
                fontWeight: FontWeight.w700,
                fontFamily: CupertinoIcons.exclamationmark_circle.fontFamily,
                package: CupertinoIcons.exclamationmark_circle.fontPackage,
              ),
            ),
            Text(
              '  $title',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
