part of 'theme_cubit.dart';

class ThemeState {
  final ThemeMode themeMode;

  const ThemeState({
    required this.themeMode,
  });

  factory ThemeState.initial() {
    return const ThemeState(
      themeMode: ThemeMode.system,
    );
  }

  ThemeState copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThemeState && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;
}
