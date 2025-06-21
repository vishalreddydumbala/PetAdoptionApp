import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoptionapp/const/theme/theme_cubit.dart';
import 'package:petadoptionapp/utiles/screen_util/screen_util.dart';
import 'package:petadoptionapp/utiles/screen_util/text_util.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextUtil.titleLarge(context),
        ),
      ),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ListView(
            padding: ScreenUtil.padding(all: 4),
            children: [
              // Theme Section
              _buildSectionHeader(context, 'Appearance'),
              SizedBox(height: ScreenUtil.h(1)),

              // Theme Toggle Card
              _buildThemeToggleCard(context, state),

              SizedBox(height: ScreenUtil.h(2)),

              // Theme Options Card
              _buildThemeOptionsCard(context, state),

              SizedBox(height: ScreenUtil.h(3)),

              // Other Settings
              _buildSectionHeader(context, 'Other Settings'),
              SizedBox(height: ScreenUtil.h(1)),

              _buildSettingsCard(
                context,
                icon: Icons.notifications,
                title: 'Notifications',
                subtitle: 'Manage your notification preferences',
                onTap: () {
                  // Navigate to notifications settings
                },
              ),

              SizedBox(height: ScreenUtil.h(1)),

              _buildSettingsCard(
                context,
                icon: Icons.language,
                title: 'Language',
                subtitle: 'Change app language',
                onTap: () {
                  // Navigate to language settings
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: TextUtil.titleMedium(context, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildThemeToggleCard(BuildContext context, ThemeState state) {
    return Card(
      child: Padding(
        padding: ScreenUtil.padding(all: 4),
        child: Row(
          children: [
            Container(
              padding: ScreenUtil.padding(all: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(ScreenUtil.r(8)),
              ),
              child: Icon(
                state.themeMode == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
                color: Theme.of(context).primaryColor,
                size: ScreenUtil.sp(24),
              ),
            ),

            SizedBox(width: ScreenUtil.w(4)),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dark Mode',
                    style: TextUtil.bodyLarge(context, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: ScreenUtil.h(0.5)),
                  Text(
                    state.themeMode == ThemeMode.dark
                        ? 'Dark theme is enabled'
                        : 'Light theme is enabled',
                    style: TextUtil.bodyMedium(context,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
            ),

            Switch(
              value: state.themeMode == ThemeMode.dark,
              onChanged: (value) {
                context.read<ThemeCubit>().toggleTheme();
              },
              activeColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOptionsCard(BuildContext context, ThemeState state) {
    return Card(
      child: Padding(
        padding: ScreenUtil.padding(all: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Options',
              style: TextUtil.bodyLarge(context, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: ScreenUtil.h(2)),

            // Light Theme Option
            _buildThemeOption(
              context,
              icon: Icons.light_mode,
              title: 'Light',
              subtitle: 'Light theme',
              isSelected: state.themeMode == ThemeMode.light,
              onTap: () => context.read<ThemeCubit>().setLightTheme(),
            ),

            SizedBox(height: ScreenUtil.h(1)),

            // Dark Theme Option
            _buildThemeOption(
              context,
              icon: Icons.dark_mode,
              title: 'Dark',
              subtitle: 'Dark theme',
              isSelected: state.themeMode == ThemeMode.dark,
              onTap: () => context.read<ThemeCubit>().setDarkTheme(),
            ),

            SizedBox(height: ScreenUtil.h(1)),

            // System Theme Option
            _buildThemeOption(
              context,
              icon: Icons.settings_system_daydream,
              title: 'System',
              subtitle: 'Follow system theme',
              isSelected: state.themeMode == ThemeMode.system,
              onTap: () => context.read<ThemeCubit>().setSystemTheme(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required bool isSelected,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(ScreenUtil.r(8)),
      child: Container(
        padding: ScreenUtil.padding(all: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenUtil.r(8)),
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
              size: ScreenUtil.sp(20),
            ),

            SizedBox(width: ScreenUtil.w(3)),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextUtil.bodyMedium(context,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      color: isSelected ? Theme.of(context).primaryColor : null,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextUtil.bodySmall(context,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
            ),

            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).primaryColor,
                size: ScreenUtil.sp(20),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return Card(
      child: ListTile(
        leading: Container(
          padding: ScreenUtil.padding(all: 2),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(ScreenUtil.r(8)),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: ScreenUtil.sp(24),
          ),
        ),
        title: Text(
          title,
          style: TextUtil.bodyLarge(context, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          style: TextUtil.bodyMedium(context,
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: ScreenUtil.sp(16),
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
        onTap: onTap,
      ),
    );
  }
}
