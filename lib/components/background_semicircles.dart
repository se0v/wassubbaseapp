import 'package:flutter/material.dart';

class BackgroundSemicircles extends StatelessWidget {
  final Widget child;

  const BackgroundSemicircles({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, right: 215),
              child: Opacity(
                opacity: 1,
                child: Image.asset(
                  'assets/Ellipse 791.png',
                  width: 317,
                  height: 359,
                ),
              ),
            ),
            Positioned(
              top: 370,
              left: 70,
              child: Opacity(
                opacity: 1,
                child: Image.asset(
                  'assets/Ellipse 796.png',
                  width: 414,
                  height: 359,
                ),
              ),
            ),
            child,
          ],
        ));
  }
}
