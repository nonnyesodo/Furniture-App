import 'package:medical_app/global_widget/export.dart';

class AppbackButton extends StatelessWidget {
  const AppbackButton({
    super.key,
    this.onTap,
    this.color,
  });
  final Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppshadowContainer(
        radius: 200.r,
        padding: EdgeInsets.all(size.width * 0.02),
        onTap: onTap ?? () => context.pop(),
        child: Icon(Icons.arrow_back,
            color: color ?? AppColors.blackOrWhite(context), size: 25.sp));
  }
}
