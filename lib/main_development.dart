import 'package:flutter/material.dart';
import 'package:petadoptionapp/app/app.dart';
import 'package:petadoptionapp/app/injection_container.dart';
import 'package:petadoptionapp/bootstrap.dart';
import 'package:petadoptionapp/const/shared_prefrence/shared_preference_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferenceConfig.init();
  await initializeDependencies();
  await bootstrap(() => const App());
}
