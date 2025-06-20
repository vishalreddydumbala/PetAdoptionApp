import 'package:flutter/material.dart';
import 'package:petadoptionapp/const/routes/app_routes.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pet Adoption App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),

      routerConfig: AppRoutes.router,


    );
  }
}
