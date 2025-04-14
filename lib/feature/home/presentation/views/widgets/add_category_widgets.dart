import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodo_app/constants.dart';
import 'package:mtodo_app/core/utils/app_styles.dart';
import 'package:mtodo_app/feature/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/category_circle_item.dart';

class AddCategoryWidgets extends StatefulWidget {
  const AddCategoryWidgets({super.key});

  @override
  State<AddCategoryWidgets> createState() => _AddCategoryWidgetsState();
}

class _AddCategoryWidgetsState extends State<AddCategoryWidgets> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Text(
          'Category',
          style:AppStyles.styleBold30(context).copyWith(
              fontSize: 18,
              color: Colors.black
             ),
        ),
        SizedBox(
          height: 50,
          width: 200,
          child: ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).categoryImage = kCategoriesImage[index];
                setState(() {
                  
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CircleImage(
                  isActive: currentIndex == index,
                image: kCategoriesImage[index],),
              ),
            ),
            itemCount: kCategoriesImage.length,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }
}


