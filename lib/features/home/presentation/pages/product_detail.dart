import 'package:medical_app/core/config/page_route/route_name.dart';
import 'package:medical_app/features/home/data/model/product_model.dart';
import 'package:medical_app/global_widget/export.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Color(0XFFece8e5),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppbackButton(),
                  5.horizontalSpace,
                  Spacer(),
                  AppshadowContainer(
                      padding: EdgeInsets.all(size.width * 0.02),
                      radius: 200.r,
                      onTap: () {},
                      child: Icon(Icons.file_download, size: 30.sp)),
                ],
              ),
              20.verticalSpace,
              Hero(
                tag: product.imageUrl ?? '',
                child: AppNetwokImage(
                    height: size.height * 0.5,
                    width: size.width,
                    fit: BoxFit.cover,
                    radius: 20.r,
                    imageUrl: product.imageUrl ?? ''),
              ),
              20.verticalSpace,
              AppExoText(
                  text: product.productName ?? '',
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
              10.verticalSpace,
              AppExoText(text: product.productDecription ?? '', maxLines: 30),
              20.verticalSpace,
              Row(
                children: [
                  AppExoText(
                      text: "\$${product.price ?? ''}",
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                  Spacer(),
                  Icon(Icons.favorite_outline, size: 25.sp),
                  15.horizontalSpace,
                  AppshadowContainer(
                      color: AppColors.black,
                      radius: 100.r,
                      padding: EdgeInsets.all(size.width * 0.03),
                      child: Icon(Icons.shopping_cart_outlined,
                          size: 25.sp, color: AppColors.white))
                ],
              ),
              30.verticalSpace,
              Center(
                child: Appbutton(
                  onTap: () => context.push(RouteName.arView.path,
                      extra: product.imageUrl),
                  width: size.width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppExoText(text: "Try AR View", color: AppColors.white),
                      Icon(Icons.view_in_ar,
                          size: 25.sp, color: AppColors.white)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
