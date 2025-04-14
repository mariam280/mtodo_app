import 'package:flutter/material.dart';
import 'package:mtodo_app/constants.dart';
import 'package:mtodo_app/core/utils/app_images.dart';
import 'package:mtodo_app/core/utils/app_styles.dart';

class AddTaskHeader extends StatelessWidget {
  const AddTaskHeader({super.key, required this.titleBar});
  final String titleBar;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      titleBar,
                      style: AppStyles.styleSemiBold16(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: -10,
            child: IgnorePointer(
              ignoring: true,
              child: Image.asset(
                Assets.imagePage2Ellipse1,
                fit: BoxFit.contain,
              ),
            )),
        Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              Assets.imagePage2Ellipse2,
              fit: BoxFit.contain,
            )),
      ],
    );
  }
}
