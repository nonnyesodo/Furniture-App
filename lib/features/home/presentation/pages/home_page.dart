import 'package:medical_app/core/config/page_route/route_name.dart';
import 'package:medical_app/core/res/theme/assets.dart';
import 'package:medical_app/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:medical_app/global_widget/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final product = context.watch<HomeCubit>().product;
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
                    onTap: () {
                      context.read<HomeCubit>().fetchProducts();
                    },
                    child: Icon(Icons.search, size: 30.sp)),
                10.horizontalSpace,
                AppshadowContainer(
                    padding: EdgeInsets.all(size.width * 0.02),
                    radius: 200.r,
                    onTap: () {},
                    child: Icon(Icons.shopping_bag_outlined, size: 30.sp)),
              ],
            ),
            20.verticalSpace,
            AppExoText(
                text: 'Catalog', fontWeight: FontWeight.w500, fontSize: 35),
            20.verticalSpace,
            SingleChildScrollView(
              child: Row(
                  children: List.generate(
                      3,
                      (index) => AppshadowContainer(
                            radius: 300.r,
                            width: size.width * 0.15,
                            height: size.width * 0.15,
                            padding: EdgeInsets.all(size.width * 0.04),
                            margin: EdgeInsets.only(right: size.width * 0.02),
                            child: index == 0
                                ? AppExoText(text: "All")
                                : Icon(Icons.chair_outlined),
                          ))),
            ),
            20.verticalSpace,
            AppshadowContainer(
              color: Color(0XFFf6c253),
              radius: size.width * 0.08,
              padding: EdgeInsets.all(size.width * 0.06),
              child: Row(
                children: [
                  Column(children: [
                    AppExoText(
                        text: 'New furniture and\naccessories',
                        fontWeight: FontWeight.w600),
                    10.verticalSpace,
                    Appbutton(
                        buttonColor: AppColors.white,
                        width: size.width * 0.3,
                        height: size.width * 0.08,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppExoText(
                                  text: "Learn More",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                              Icon(Icons.arrow_forward, size: 15.sp)
                            ]))
                  ]),
                  Spacer(),
                  Image.asset(AppAssets.card,
                      height: size.height * 0.1,
                      fit: BoxFit.cover,
                      width: size.width * 0.4),
                ],
              ),
            ),
            20.verticalSpace,
            Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: size.width * 0.03,
                    crossAxisSpacing: size.width * 0.03,
                    childAspectRatio: 0.65,
                    children: List.generate(
                        product.length,
                        (index) => AppshadowContainer(
                              padding: EdgeInsets.all(size.width * 0.04),
                              radius: size.width * 0.04,
                              onTap: () {
                                context.push(RouteName.productDetail.path,
                                    extra: product[index]);
                              },
                              child: Column(
                                children: [
                                  Hero(
                                    tag: "${product[index].imageUrl}",
                                    child: AppNetwokImage(
                                        radius: 10.r,
                                        height: size.width * 0.4,
                                        fit: BoxFit.cover,
                                        width: size.width * 0.4,
                                        imageUrl:
                                            product[index].imageUrl ?? ''),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.25,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppExoText(
                                                text: product[index]
                                                        .productCategory ??
                                                    '',
                                                fontSize: 12),
                                            AppExoText(
                                                text: product[index]
                                                        .productName ??
                                                    '',
                                                fontWeight: FontWeight.w700),
                                            2.verticalSpace,
                                            Row(
                                                children: List.generate(
                                                    5,
                                                    (index) => Icon(Icons.star,
                                                        size: 15.sp))),
                                            5.verticalSpace,
                                            AppExoText(
                                                text:
                                                    '\$${product[index].price ?? ''}',
                                                fontWeight: FontWeight.w500),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      AppshadowContainer(
                                        color: AppColors.black,
                                        radius: 100.r,
                                        padding:
                                            EdgeInsets.all(size.width * 0.02),
                                        child: Icon(
                                            Icons.shopping_cart_outlined,
                                            size: 17.sp,
                                            color: AppColors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))))
          ],
        ),
      ),
      floatingActionButton: AppshadowContainer(
          onTap: () => context.push(RouteName.addProduct.path),
          height: size.height * 0.06,
          width: size.height * 0.06,
          color: Color(0XFFf6c253),
          child: Icon(Icons.add, size: 20.sp, color: AppColors.white)),
    );
  }
}
