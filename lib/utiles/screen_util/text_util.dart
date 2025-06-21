import 'package:flutter/material.dart';
import 'package:petadoptionapp/utiles/screen_util/screen_util.dart';

class TextUtil {
  // Predefined text sizes
  static const double _baseSmall = 12.0;
  static const double _baseMedium = 14.0;
  static const double _baseLarge = 16.0;
  static const double _baseXLarge = 18.0;
  static const double _baseXXLarge = 20.0;
  static const double _baseTitle = 24.0;
  static const double _baseHeading = 28.0;
  static const double _baseDisplay = 32.0;

  // Responsive text sizes
  static double get small => ScreenUtil.sp(_baseSmall);
  static double get medium => ScreenUtil.sp(_baseMedium);
  static double get large => ScreenUtil.sp(_baseLarge);
  static double get xLarge => ScreenUtil.sp(_baseXLarge);
  static double get xxLarge => ScreenUtil.sp(_baseXXLarge);
  static double get title => ScreenUtil.sp(_baseTitle);
  static double get heading => ScreenUtil.sp(_baseHeading);
  static double get display => ScreenUtil.sp(_baseDisplay);

  // Custom responsive text size
  static double size(double fontSize) => ScreenUtil.sp(fontSize);

  // Responsive text styles
  static TextStyle bodySmall(BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
      fontSize: small,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle bodyMedium(BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: medium,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle bodyLarge(BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontSize: large,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle titleSmall(BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return Theme.of(context).textTheme.titleSmall!.copyWith(
      fontSize: xLarge,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle titleMedium(BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: xxLarge,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle titleLarge(BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
      fontSize: title,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w700,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle headlineSmall(BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return Theme.of(context).textTheme.headlineSmall!.copyWith(
      fontSize: title,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w700,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle headlineMedium(BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
      fontSize: heading,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w700,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle headlineLarge(BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
      fontSize: display,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w800,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  // Custom text style with responsive size
  static TextStyle custom(BuildContext context, {
    required double fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: ScreenUtil.sp(fontSize),
      color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
      fontFamily: fontFamily,
    );
  }

  // Responsive text based on device type
  static TextStyle responsiveText(BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    final fontSize = ScreenUtil.responsive<double>(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );

    return TextStyle(
      fontSize: ScreenUtil.sp(fontSize),
      color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}
