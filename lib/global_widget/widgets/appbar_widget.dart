 
import 'package:medical_app/global_widget/export.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget(
      {super.key,
      required this.title,
      this.subTitle,
      this.subColorTitle,
      this.onTap,
      this.titleColor,
      this.backColor,
      this.trailing});
  final String title;
  final String? subTitle;
  final Color? subColorTitle, titleColor, backColor;
  final Function()? onTap;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppbackButton(color: backColor),
        Spacer(),
        AppExoText(
            color: titleColor ?? AppColors.blackOrWhite(context),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            text: title),
        Spacer(),
        trailing ??
            GestureDetector(
              onTap: onTap,
              child: AppExoText(
                  text: subTitle ?? '',
                  color: subColorTitle ?? AppColors.yellow,
                  fontWeight: FontWeight.w600),
            )
      ],
    );
  }
}
