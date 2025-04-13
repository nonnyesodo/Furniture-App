import 'package:medical_app/global_widget/export.dart';

class ApptextField extends StatelessWidget {
  const ApptextField(
      {super.key,
      this.title,
      this.prefixIcon,
      this.sufixIcon,
      this.controller,
      this.hintText,
      this.malxLine,
      this.validator,
      this.onChange,
      this.onTap,
      this.readOnly = false,
      this.keyboardType,
      this.titleColor,
      this.suffix,
      this.hintTextColor});
  final String? title, hintText;
  final int? malxLine;
  final IconData? prefixIcon, sufixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChange;
  final Function()? onTap;
  final bool readOnly;
  final TextInputType? keyboardType;
  final Color? titleColor, hintTextColor;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppExoText(text: title ?? ""),
        2.verticalSpace,
        TextFormField(
            onTap: onTap,
            style: GoogleFonts.exo(),
            textCapitalization: TextCapitalization.sentences,
            readOnly: readOnly,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: malxLine,
            controller: controller,
            onChanged: onChange,
            keyboardType: keyboardType,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
                errorMaxLines: 3,
                suffixIconColor: WidgetStateColor.resolveWith((states) =>
                    states.contains(WidgetState.focused)
                        ? AppColors.black
                        : AppColors.black.withValues(alpha: 0.4)),
                prefixIconColor: WidgetStateColor.resolveWith((states) =>
                    states.contains(WidgetState.focused)
                        ? AppColors.black
                        : AppColors.black.withValues(alpha: 0.4)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide(color: AppColors.textGray0)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide:
                        BorderSide(color: AppColors.greyOrWhite(context))),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide(color: AppColors.redText)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide:
                        BorderSide(color: AppColors.blackOrWhite(context))),
                focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp), borderSide: BorderSide(color: AppColors.redText)),
                hintText: hintText ?? '',
                hintStyle: GoogleFonts.exo(fontSize: 12.sp, fontWeight: FontWeight.w400, color: hintTextColor ?? AppColors.textGray1),
                suffixIcon: sufixIcon == null ? null : Icon(sufixIcon, color: AppColors.blackOrWhite(context), size: 20.sp),
                prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, color: AppColors.blackOrWhite(context), size: 20.sp))),
      ],
    );
  }
}
