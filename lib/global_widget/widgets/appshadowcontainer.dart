import 'package:flutter/material.dart';

import '../../core/res/theme/colors.dart';

class AppshadowContainer extends StatelessWidget {
  const AppshadowContainer(
      {super.key,
      this.child,
      this.shadowcolour,
      this.color,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.radius,
      this.onTap,
      this.borderColor,
      this.border = false,
      this.alignment,
      this.borderWidth,
      this.image});
  final Widget? child;
  final Color? shadowcolour, color, borderColor;
  final EdgeInsetsGeometry? padding, margin;
  final double? width, height, radius, borderWidth;
  final Function()? onTap;
  final bool border;
  final AlignmentGeometry? alignment;
  final DecorationImage? image;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
        onTap: onTap,
        child: Container(
            alignment: alignment ?? Alignment.center,
            width: width,
            height: height,
            margin: margin,
            padding: padding,
            decoration: BoxDecoration(
                color: color ?? AppColors.white,
                border: Border.all(
                    width: border ? borderWidth ?? 0.5 : 0,
                    color: borderColor ?? Colors.transparent),
                image: image,
                boxShadow: [
                  BoxShadow(
                      color: shadowcolour ?? Colors.transparent,
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                      spreadRadius: 4)
                ],
                borderRadius:
                    BorderRadius.circular(radius ?? size.width * 0.02)),
            child: child));
  }
}
