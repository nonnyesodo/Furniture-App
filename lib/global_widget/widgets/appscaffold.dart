import 'package:medical_app/global_widget/export.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key,
      this.color,
      required this.body,
      this.floatingActionButton,
      this.isloading = false,
      this.bottomSheet});
  final Color? color;
  final Widget? body, floatingActionButton, bottomSheet;

  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: bottomSheet,
        backgroundColor: color ?? AppColors.white,
        floatingActionButton: floatingActionButton,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.h),
            child: AppBar(
                forceMaterialTransparency: true,
                automaticallyImplyLeading: false)),
        body: GestureDetector(
          child: Stack(
            children: [
              AbsorbPointer(
                absorbing: isloading,
                child: Opacity(opacity: isloading ? 0.2 : 1.0, child: body),
              ),
              isloading
                  ? Column(
                      children: [
                        SizedBox(height: 220.h),
                        Center(
                            child: LoadingAnimationWidget.discreteCircle(
                                color: AppColors.redText, size: 40.sp)),
                        3.verticalSpace,
                        const AppExoText(
                            text: ' Please wait...',
                            fontWeight: FontWeight.w600),
                      ],
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ));
  }
}
