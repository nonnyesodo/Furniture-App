import 'package:medical_app/core/config/page_route/route_name.dart';
import 'package:medical_app/core/res/theme/assets.dart';
import 'package:medical_app/features/home/presentation/bloc/cubit/home_cubit.dart';

import 'package:medical_app/global_widget/export.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: size.height * 0.65,
            padding: EdgeInsets.only(top: size.width * 0.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size.width * 0.3),
                  bottomRight: Radius.circular(size.width * 0.03),
                ),
                image: DecorationImage(
                    image: AssetImage(AppAssets.splash1), fit: BoxFit.cover))),
        Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppExoText(
                  text: 'Amazing Elegant\nFurniture',
                  fontSize: 35,
                  fontWeight: FontWeight.w600),
              10.verticalSpace,
              AppExoText(
                  text:
                      'Create a refined atmosphere with luxurious furniture designed for timeless elegance',
                  maxLines: 3),
              30.verticalSpace,
              Appbutton(
                  label: 'Let\'s explore',
                  onTap: () {
                    context.read<HomeCubit>().loginUser();
                    context.go(RouteName.botomNav.path);
                  })
            ],
          ),
        )
      ],
    ));
  }
}
