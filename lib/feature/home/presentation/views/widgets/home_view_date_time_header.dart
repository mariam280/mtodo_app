import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtodo_app/core/utils/app_styles.dart';

class HomeViewDateTimeHeader extends StatelessWidget {
  const HomeViewDateTimeHeader({
    super.key
  });

  @override
  Widget build(BuildContext context) {
     String formattedDate = DateFormat('MMMM d, yyyy').format(DateTime.now());
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.28,
      decoration: BoxDecoration(
        color: Color(0xff4A3780),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SafeArea(
            child: Text(
              formattedDate,
              style: AppStyles.styleSemiBold16(context).copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            'My Mtodo List',
            style: AppStyles.styleBold30(context).copyWith(
              fontSize: 27,
            ),
          )
        ],
      ),
    );
  }
}
