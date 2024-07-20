import 'package:flutter/material.dart';

class BirdWidget extends StatelessWidget {
  const BirdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Image.asset('assets/bird.webp'),
    );
  }
}
