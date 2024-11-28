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
          child,
          Positioned(
              left: -250,
              top: 10,
              child: IgnorePointer(
                child: Container(
                  width: 450,
                  height: 450,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color.fromRGBO(106, 102, 216, 1).withOpacity(1),
                        Colors.transparent,
                      ],
                      radius: 0.6,
                    ),
                  ),
                ),
              )),
          Positioned(
              right: -250,
              bottom: 10,
              child: IgnorePointer(
                child: Container(
                  width: 450,
                  height: 450,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color.fromRGBO(106, 102, 216, 1).withOpacity(1),
                        Colors.transparent,
                      ],
                      radius: 0.6,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
