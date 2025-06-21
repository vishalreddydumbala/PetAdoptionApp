import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoptionapp/const/shared_prefrence/shared_preference_config.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial()) {
    _loadTheme();
  }

  static const String _themeKey = 'theme_mode';

  void _loadTheme() {
    final savedTheme = SharedPreferenceConfig.getString(_themeKey);
    final themeMode = _getThemeModeFromString(savedTheme);
    emit(state.copyWith(themeMode: themeMode));
  }

  void toggleTheme() {
    final newThemeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    _saveTheme(newThemeMode);
    emit(state.copyWith(themeMode: newThemeMode));
  }

  void setTheme(ThemeMode themeMode) {
    _saveTheme(themeMode);
    emit(state.copyWith(themeMode: themeMode));
  }

  void setLightTheme() {
    setTheme(ThemeMode.light);
  }

  void setDarkTheme() {
    setTheme(ThemeMode.dark);
  }

  void setSystemTheme() {
    setTheme(ThemeMode.system);
  }

  void _saveTheme(ThemeMode themeMode) {
    SharedPreferenceConfig.setString(_themeKey, themeMode.name);
  }

  ThemeMode _getThemeModeFromString(String themeString) {
    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  bool get isLightTheme => state.themeMode == ThemeMode.light;
  bool get isDarkTheme => state.themeMode == ThemeMode.dark;
  bool get isSystemTheme => state.themeMode == ThemeMode.system;
}
