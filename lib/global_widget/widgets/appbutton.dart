import '../export.dart';

class Appbutton extends StatelessWidget {
  const Appbutton(
      {super.key,
      this.buttonColor,
      this.child,
      this.label,
      this.onTap,
      this.width,
      this.height,
      this.labelColor,
      this.isLoading = false,
      this.borderColor,
      this.border,
      this.labelSize,
      this.labelWeight});

  final Color? buttonColor, borderColor, labelColor;
  final Widget? child;
  final String? label;
  final Function()? onTap;
  final double? width, height, labelSize;
  final bool isLoading;
  final bool? border;
  final FontWeight? labelWeight;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
        onTap: onTap,
        shadowcolour: Colors.transparent,
        width: width ?? size.width,
        border: border ?? false,
        borderColor: borderColor ?? Colors.transparent,
        height: height ?? size.height * 0.055,
        radius: size.width * 0.04,
        color: buttonColor ?? AppColors.black,
        child: isLoading
            ? LoadingAnimationWidget.flickr(
                rightDotColor: AppColors.yellow,
                leftDotColor: Colors.blueAccent,
                size: 30.sp)
            : child ??
                AppExoText(
                    text: label ?? '',
                    color: labelColor ?? AppColors.white,
                    fontSize: labelSize ?? 16,
                    fontWeight: labelWeight ?? FontWeight.w700));
  }
}
