import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({super.key, required this.image, required this.isActive});
  final String image;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius:isActive? 36:25,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: isActive? 32:22,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}