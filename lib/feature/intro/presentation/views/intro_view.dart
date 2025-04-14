import 'package:flutter/material.dart';
import 'package:mtodo_app/feature/intro/presentation/views/widgets/intro_view_item.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroViewItem(),
    );
  }
}