import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoptionapp/const/routes/app_routes.dart';

import 'package:petadoptionapp/app/injection_container.dart';
import 'package:petadoptionapp/const/theme/app_theme.dart';
import 'package:petadoptionapp/const/theme/theme_cubit.dart';
import 'package:petadoptionapp/utiles/screen_util/screen_util.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Pet Adoption App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            routerConfig: AppRoutes.router,
            builder: (context, child) {
              // Initialize ScreenUtil here
              ScreenUtil.init(context);
              return child!;
            },
          );
        },
      ),
    );
  }
}
