import 'package:flutter/material.dart';
import 'package:mtodo_app/constants.dart';
import 'package:mtodo_app/core/utils/app_styles.dart';

Future<bool> showConfirmDialog({
  required BuildContext context,
  required VoidCallback onEdit,
  required VoidCallback onDelete,
}) async {
    return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Confirmation',
                  style: AppStyles.styleBold30(context).copyWith(
                    color: kPrimaryColor,
                    fontSize: 24,
                  ),
                ),
                content: Text(
                  'Choose Edit OR Delete! ',
                  style: AppStyles.styleBold30(context).copyWith(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                       Navigator.of(context).pop(false); 
                    onEdit();
                      },
                      child: Text(
                        'Edit',
                        style: AppStyles.styleBold30(context).copyWith(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true); 
                    onDelete();
                        
                      },
                      child: Text(
                        'Delete',
                        style: AppStyles.styleBold30(context).copyWith(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                      )),
                ],
              );
            }) ??
        false;
  }




  Future<bool> showExitDialog(BuildContext context) async {
    return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Exit Confirmation',
                   style: AppStyles.styleBold30(context).copyWith(
                    color: kPrimaryColor,
                    fontSize: 24,
                  ),
                ),
                content: Text(
                  'Do you want to exit the app',
                 style: AppStyles.styleBold30(context).copyWith(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        'No',
                         style: AppStyles.styleBold30(context).copyWith(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        //SystemNavigator.pop();
                      },
                      child: Text(
                        'yes',
                        style: AppStyles.styleBold30(context).copyWith(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                      )),
                ],
              );
            }) ??
        false;
  }




