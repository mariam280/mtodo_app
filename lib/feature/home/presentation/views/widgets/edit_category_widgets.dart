import 'package:flutter/material.dart';
import 'package:mtodo_app/constants.dart';
import 'package:mtodo_app/core/utils/app_styles.dart';
import 'package:mtodo_app/feature/home/data/models/task_model.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/category_circle_item.dart';

class EditCategoryWidgets extends StatefulWidget {
  const EditCategoryWidgets({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<EditCategoryWidgets> createState() => _EditCategoryWidgetsState();
}

class _EditCategoryWidgetsState extends State<EditCategoryWidgets> {
 late int currentIndex ;
 @override
  void initState() {
    currentIndex = kCategoriesImage.indexOf(widget.taskModel.catImage);
    super.initState();
  }
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
                widget.taskModel.catImage = kCategoriesImage[index];
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