import 'package:flutter/material.dart';
import 'package:mtodo_app/constants.dart';
import 'package:mtodo_app/core/utils/app_styles.dart';

class CustomButon extends StatelessWidget {
  const CustomButon({super.key,  this.onTap ,required this.text}) ;
 final VoidCallback? onTap;
 final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(text,style: AppStyles.styleBold30(context).copyWith(
            fontSize: 20,
            color: Colors.white,
          )),
        ),
      ),
    );
  }
}
