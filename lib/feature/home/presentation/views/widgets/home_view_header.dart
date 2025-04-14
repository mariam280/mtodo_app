import 'package:flutter/material.dart';
import 'package:mtodo_app/core/utils/app_images.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/home_view_date_time_header.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        HomeViewDateTimeHeader(),
        Positioned(
            top: 65,
            left: -21,
            child: Image.asset(
              Assets.imagePage1Ellipse1,
              fit: BoxFit.contain,
            )),
        Positioned(
          top: 0,
          right: 0,
          child:
              Image.asset(Assets.imagePage1Ellipse2, fit: BoxFit.contain),
        ),
      ],
    );
  }
}

