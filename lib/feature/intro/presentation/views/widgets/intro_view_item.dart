import 'package:flutter/material.dart';
import 'package:mtodo_app/core/utils/app_images.dart';
import 'package:mtodo_app/core/utils/app_styles.dart';
import 'package:mtodo_app/feature/home/presentation/views/home_view.dart';
import 'package:mtodo_app/core/widgets/custom_button.dart';

class IntroViewItem extends StatelessWidget {
  const IntroViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         SizedBox(height: MediaQuery.sizeOf(context).height*0.11,),
        ClipRRect(
          child: Image.asset(Assets.imageOnBoard1,fit: BoxFit.fill,height: MediaQuery.sizeOf(context).height*0.55,)),
       SizedBox(height: 20,),
        Text(
          'Manage your tasks',
          style: AppStyles.styleBold30(context).copyWith(
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20,),
        Text(
          'organize, plan, and collaborate on tasks with\n Mtodo.Your busy life deserves this.you can manage\n checklist and your goal. ',
          textAlign: TextAlign.center,
          style: AppStyles.styleRegular12(context),
        ),
        SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,),
          child: CustomButon(
            text: 'Get Started',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeView();
              }));
            },
          ),
        )
      ],
    );
  }
}
