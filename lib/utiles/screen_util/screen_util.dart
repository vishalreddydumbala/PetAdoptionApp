import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScreenUtil {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double safeAreaHorizontal;
  static late double safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late double textScaleFactor;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    orientation = _mediaQueryData.orientation;
    textScaleFactor = _mediaQueryData.textScaleFactor;

    safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - safeAreaVertical) / 100;

    deviceType = _getDeviceType();
  }

  static DeviceType _getDeviceType() {
    if (screenWidth < 600) {
      return DeviceType.mobile;
    } else if (screenWidth >= 600 && screenWidth < 1200) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  // Responsive width
  static double w(double width) {
    return screenWidth * (width / 100);
  }

  // Responsive height
  static double h(double height) {
    return screenHeight * (height / 100);
  }

  // Responsive font size
  static double sp(double fontSize) {
    return fontSize * (screenWidth / 375); // 375 is base width (iPhone X)
  }

  // Responsive radius
  static double r(double radius) {
    return radius * (screenWidth / 375);
  }

  // Safe area width
  static double sw(double width) {
    return safeBlockHorizontal * width;
  }

  // Safe area height
  static double sh(double height) {
    return safeBlockVertical * height;
  }

  // Minimum of width and height for square elements
  static double min(double size) {
    return math.min(w(size), h(size));
  }

  // Maximum of width and height
  static double max(double size) {
    return math.max(w(size), h(size));
  }

  // Responsive padding
  static EdgeInsets padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return EdgeInsets.only(
      top: top != null ? h(top) : (vertical != null ? h(vertical) : (all != null ? h(all) : 0)),
      bottom: bottom != null ? h(bottom) : (vertical != null ? h(vertical) : (all != null ? h(all) : 0)),
      left: left != null ? w(left) : (horizontal != null ? w(horizontal) : (all != null ? w(all) : 0)),
      right: right != null ? w(right) : (horizontal != null ? w(horizontal) : (all != null ? w(all) : 0)),
    );
  }

  // Responsive margin
  static EdgeInsets margin({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return EdgeInsets.only(
      top: top != null ? h(top) : (vertical != null ? h(vertical) : (all != null ? h(all) : 0)),
      bottom: bottom != null ? h(bottom) : (vertical != null ? h(vertical) : (all != null ? h(all) : 0)),
      left: left != null ? w(left) : (horizontal != null ? w(horizontal) : (all != null ? w(all) : 0)),
      right: right != null ? w(right) : (horizontal != null ? w(horizontal) : (all != null ? w(all) : 0)),
    );
  }

  // Check if device is mobile
  static bool get isMobile => deviceType == DeviceType.mobile;

  // Check if device is tablet
  static bool get isTablet => deviceType == DeviceType.tablet;

  // Check if device is desktop
  static bool get isDesktop => deviceType == DeviceType.desktop;

  // Check if orientation is portrait
  static bool get isPortrait => orientation == Orientation.portrait;

  // Check if orientation is landscape
  static bool get isLandscape => orientation == Orientation.landscape;

  // Get responsive value based on device type
  static T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }

  // Get responsive columns for grid
  static int getResponsiveColumns({
    int mobile = 1,
    int? tablet,
    int? desktop,
  }) {
    return responsive<int>(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}

enum DeviceType { mobile, tablet, desktop }
