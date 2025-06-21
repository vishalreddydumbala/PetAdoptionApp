import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petadoptionapp/const/routes/app_routes.dart';
import 'package:petadoptionapp/const/routes/route_constants.dart';
import 'package:petadoptionapp/modules/theme_toggle_button.dart';
import 'package:petadoptionapp/utiles/screen_util/screen_util.dart';
import 'package:petadoptionapp/utiles/screen_util/text_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pet Adoption',
          style: TextUtil.titleLarge(context),
        ),
        actions: [
          const ThemeToggleButton(),
          SizedBox(width: ScreenUtil.w(2)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Pet Adoption App!',
              style: TextUtil.headlineMedium(context),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: ScreenUtil.h(3)),

            ElevatedButton(
              onPressed: () {
        context.go(RouteConstants.petListPath);
              },
              child: Text(
                'Go to Settings',
                style: TextUtil.bodyLarge(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
