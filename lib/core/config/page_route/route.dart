import 'package:medical_app/core/config/page_route/route_name.dart';
import 'package:medical_app/features/auth/presentation/pages/auth_page.dart';
import 'package:medical_app/features/home/data/model/product_model.dart';
import 'package:medical_app/features/home/presentation/pages/add_product.dart';
import 'package:medical_app/features/home/presentation/pages/ar_viw.dart';
import 'package:medical_app/features/home/presentation/pages/product_detail.dart';
import 'package:medical_app/features/home/presentation/pages/home_page.dart';
import 'package:medical_app/features/splash_onboard/presentation/pages/splash_screen.dart';
import 'package:medical_app/global_widget/export.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoute {
  // GoRouter configuration
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: RouteName.splash.path,
          builder: (context, state) {
            return SplashScreen();
          }),
      GoRoute(
          path: RouteName.auth.path,
          builder: (context, state) {
            return AuthPage();
          }),
      GoRoute(
          path: RouteName.addProduct.path,
          builder: (context, state) {
            return AddProduct();
          }),
      GoRoute(
          path: RouteName.botomNav.path,
          builder: (context, state) {
            return HomePage();
          }),
      GoRoute(
          path: RouteName.productDetail.path,
          builder: (context, state) {
            final ProductModel product = state.extra as ProductModel;
            return ProductDetail(product: product);
          }),
      GoRoute(
          path: RouteName.arView.path,
          builder: (context, state) {
            final String image = state.extra as String;
            return ArView(image: image);
          }),
    ],
  );
}
