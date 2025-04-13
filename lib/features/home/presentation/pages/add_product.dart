import 'package:medical_app/core/config/page_route/route_name.dart';
import 'package:medical_app/core/utils/extension.dart';
import 'package:medical_app/features/home/data/local/home_static_repo.dart';
import 'package:medical_app/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:medical_app/global_widget/export.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final readHome = context.read<HomeCubit>();
    final watchHome = context.watch<HomeCubit>();
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ProductUploaded) {
          context.push(RouteName.botomNav.path);
        }
      },
      child: AppScaffold(
          isloading: watchHome.state is HomeLoading,
          color: Color(0XFFece8e5),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  AppbarWidget(title: "Add Product"),
                  20.verticalSpace,
                  Expanded(
                      child: ListView(
                    children: [
                      watchHome.selectedImage != null
                          ? Image.file(watchHome.selectedImage!,
                              height: size.height * 0.2, fit: BoxFit.cover)
                          : AppshadowContainer(
                              onTap: () => readHome.pickImage(),
                              padding: EdgeInsets.all(size.width * 0.06),
                              child: Column(children: [
                                Icon(Icons.cloud_upload_outlined, size: 50.sp),
                                AppExoText(text: "Upload Product Image")
                              ])),
                      40.verticalSpace,
                      ApptextField(
                        title: "Product Name",
                        controller: watchHome.productName,
                        validator: (p0) =>
                            p0?.validateAnyField(field: "Product name"),
                      ),
                      20.verticalSpace,
                      ApptextField(
                        title: "Product Description",
                        controller: watchHome.productDescription,
                        validator: (p0) =>
                            p0?.validateAnyField(field: "Product description"),
                      ),
                      20.verticalSpace,
                      ApptextField(
                        title: "Product Price",
                        controller: watchHome.productPrice,
                        keyboardType: TextInputType.number,
                        validator: (p0) =>
                            p0?.validateAnyField(field: "Product  price"),
                      ),
                      20.verticalSpace,
                      ApptextField(
                        title: "Product Category",
                        readOnly: true,
                        validator: (p0) =>
                            p0?.validateAnyField(field: "Product category"),
                        controller: watchHome.productCategory,
                        onTap: () => showModalBottomSheet(
                            context: context,
                            sheetAnimationStyle: AnimationStyle(
                                duration: Duration(milliseconds: 500)),
                            backgroundColor: Color(0XFFece8e5),
                            builder: (BuildContext context) {
                              return ProductCategoryModal(size: size);
                            }),
                      ),
                      50.verticalSpace,
                      Appbutton(
                        label: "Procced",
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            readHome.uploadProductToSupabase();
                            // readHome.loginUser();
                          }
                        },
                      )
                    ],
                  ))
                ],
              ),
            ),
          )),
    );
  }
}

class ProductCategoryModal extends StatelessWidget {
  const ProductCategoryModal({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.04),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppbarWidget(title: "Select Category"),
          20.verticalSpace,
          Column(
              children: List.generate(
            HomeStaticRepo.category.length,
            (index) => GestureDetector(
              onTap: () {
                context
                    .read<HomeCubit>()
                    .selectCategory(category: HomeStaticRepo.category[index]);
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.02),
                child: AppExoText(text: HomeStaticRepo.category[index]),
              ),
            ),
          )),
          20.verticalSpace,
        ],
      ),
    );
  }
}
