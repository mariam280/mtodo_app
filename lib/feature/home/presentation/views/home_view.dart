import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtodo_app/core/functions/show_dialog.dart';
import 'package:mtodo_app/feature/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        bool exitApp = await showExitDialog(context);

        if (exitApp) {
          SystemNavigator.pop();
        }
      },
      child: const Scaffold(
        backgroundColor: Color(0XFFF1F5F9),
        body: HomeViewBody(),
      ),
    );
  }
}
