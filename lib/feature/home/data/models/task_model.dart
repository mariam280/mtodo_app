
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
   String catImage;
  @HiveField(1)
   String title;
  @HiveField(2)
   String subTitle;
  @HiveField(3)
  bool isCompleted;

  TaskModel({required this.catImage, 
  required this.title,
   required this.subTitle,
    this.isCompleted=false});
}
