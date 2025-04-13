import 'package:medical_app/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:medical_app/features/home/data/remote/home_repo.dart';
import 'package:medical_app/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:medical_app/global_widget/export.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => HomeCubit(HomeRepo())),
      ],
      child: ScreenUtilInit(
          designSize: MediaQuery.sizeOf(context),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
                routerConfig: AppRoute.router,
                debugShowCheckedModeBanner: false,
                title: 'Let\'s Chop',
                builder: (context, child) {
                  return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: child!);
                });
          }),
    );
  }
}
