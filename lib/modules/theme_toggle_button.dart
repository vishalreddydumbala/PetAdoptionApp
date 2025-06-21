import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoptionapp/const/theme/theme_cubit.dart';
import 'package:petadoptionapp/utiles/screen_util/screen_util.dart';


class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              state.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
              key: ValueKey(state.themeMode),
              size: ScreenUtil.sp(24),
            ),
          ),
          tooltip: state.themeMode == ThemeMode.dark
              ? 'Switch to Light Mode'
              : 'Switch to Dark Mode',
        );
      },
    );
  }
}
