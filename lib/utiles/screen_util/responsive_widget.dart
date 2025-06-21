import 'package:flutter/material.dart';
import 'package:petadoptionapp/utiles/screen_util/screen_util.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtil.responsive<Widget>(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceType deviceType) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return builder(context, ScreenUtil.deviceType);
  }
}

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double? mobileWidth;
  final double? tabletWidth;
  final double? desktopWidth;
  final double? mobileHeight;
  final double? tabletHeight;
  final double? desktopHeight;
  final EdgeInsetsGeometry? mobilePadding;
  final EdgeInsetsGeometry? tabletPadding;
  final EdgeInsetsGeometry? desktopPadding;
  final EdgeInsetsGeometry? mobileMargin;
  final EdgeInsetsGeometry? tabletMargin;
  final EdgeInsetsGeometry? desktopMargin;
  final Color? color;
  final Decoration? decoration;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.mobileWidth,
    this.tabletWidth,
    this.desktopWidth,
    this.mobileHeight,
    this.tabletHeight,
    this.desktopHeight,
    this.mobilePadding,
    this.tabletPadding,
    this.desktopPadding,
    this.mobileMargin,
    this.tabletMargin,
    this.desktopMargin,
    this.color,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final width = ScreenUtil.responsive<double?>(
      mobile: mobileWidth != null ? ScreenUtil.w(mobileWidth!) : null,
      tablet: tabletWidth != null ? ScreenUtil.w(tabletWidth!) : null,
      desktop: desktopWidth != null ? ScreenUtil.w(desktopWidth!) : null,
    );

    final height = ScreenUtil.responsive<double?>(
      mobile: mobileHeight != null ? ScreenUtil.h(mobileHeight!) : null,
      tablet: tabletHeight != null ? ScreenUtil.h(tabletHeight!) : null,
      desktop: desktopHeight != null ? ScreenUtil.h(desktopHeight!) : null,
    );

    final padding = ScreenUtil.responsive<EdgeInsetsGeometry?>(
      mobile: mobilePadding,
      tablet: tabletPadding,
      desktop: desktopPadding,
    );

    final margin = ScreenUtil.responsive<EdgeInsetsGeometry?>(
      mobile: mobileMargin,
      tablet: tabletMargin,
      desktop: desktopMargin,
    );

    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      color: color,
      decoration: decoration,
      child: child,
    );
  }
}

