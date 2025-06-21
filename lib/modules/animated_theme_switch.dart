import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoptionapp/const/theme/theme_cubit.dart';
import 'package:petadoptionapp/utiles/screen_util/screen_util.dart';

class AnimatedThemeSwitch extends StatelessWidget {
  const AnimatedThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.themeMode == ThemeMode.dark;

        return GestureDetector(
          onTap: () => context.read<ThemeCubit>().toggleTheme(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: ScreenUtil.w(15),
            height: ScreenUtil.h(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil.r(20)),
              color: isDark
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  top: ScreenUtil.h(0.5),
                  left: isDark ? ScreenUtil.w(8) : ScreenUtil.w(1),
                  child: Container(
                    width: ScreenUtil.w(5),
                    height: ScreenUtil.h(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Icon(
                      isDark ? Icons.dark_mode : Icons.light_mode,
                      size: ScreenUtil.sp(16),
                      color: isDark
                          ? Theme.of(context).primaryColor
                          : Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
