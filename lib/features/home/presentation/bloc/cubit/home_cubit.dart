import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/features/home/data/model/product_model.dart';
import 'package:medical_app/features/home/data/remote/home_repo.dart';
import 'package:medical_app/global_widget/export.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path_provider/path_provider.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial()) {
    fetchProducts();
  }
  final SupabaseClient supabase = Supabase.instance.client;
  final productPrice = TextEditingController();
  final productName = TextEditingController();
  final productDescription = TextEditingController();
  final productCategory = TextEditingController();

  File? selectedImage;

  pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      removeImageBackGround(imagePath: pickedFile.path);
      // selectedImage = File(pickedFile.path);
    }
  }

  uploadProductToSupabase() async {
    if (selectedImage == null) {
      ToastMessage.showWarningToast(message: "Select image");
      return;
    }
    emit(HomeLoading());
    try {
      // Convert image to bytes
      Uint8List imageBytes = await selectedImage!.readAsBytes();
      // Generate unique file name
      String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
      // Upload image to Supabase Storage
      await supabase.storage.from('images').uploadBinary(fileName, imageBytes);
      // Get the image URL
      String imageUrl = supabase.storage.from('images').getPublicUrl(fileName);
      // Store image URL & text in the database
      log("message${supabase.auth.currentUser?.id ?? ''}");
      await supabase.from('products').insert({
        'price': productPrice.text,
        'product_name': productName.text,
        'product_decription': productDescription.text,
        'product_category': productCategory.text,
        'image_url': imageUrl,
        "user_id": supabase.auth.currentUser?.id ?? ''
      });
      ToastMessage.showErrorToast(message: "Upload successful!");
      emit(ProductUploaded());
      fetchProducts();
    } catch (e) {
      log(e.toString());
      ToastMessage.showErrorToast(message: "Upload failed: $e ");
      emit(HomeError());
    }
  }

  List<ProductModel> product = [];
  fetchProducts() async {
    emit(HomeLoading());
    try {
      final response = await supabase.from('products').select();
      if (response.isNotEmpty) {
        product.clear();
        for (var prod in response) {
          product.add(ProductModel.fromJson(prod));
        }
        emit(HomeLoaded());
      }
      emit(HomeLoaded());
    } catch (e) {
      log("product$e");
      emit(HomeLoaded());
    }
  }

  removeImageBackGround({required String imagePath}) async {
    log("imagepath$imagePath");
    emit(HomeLoading());
    try {
      final response = await homeRepo.makerequestToBgRemove(imagePath);

      if (response.statusCode == 200) {
        // Save the removed background image to a file
        final directory = await getApplicationDocumentsDirectory();
        final imageFile = File('${directory.path}/image.png');
        selectedImage =
            await imageFile.writeAsBytes(await response.stream.toBytes());
        log("selec${selectedImage?.path}");
        emit(HomeLoaded());
      } else {
        log("${await response.stream.toBytes()}");
        ToastMessage.showErrorToast(
            message: 'Unable to remove image background');
        emit(HomeError());
      }
    } catch (e) {
      log("message$e");
      emit(HomeError());
    }
  }

  selectCategory({required String category}) {
    emit(HomeLoading());
    productCategory.text = category;
    emit(HomeLoaded());
  }

  sigupUser() async {
    final response = await supabase.auth
        .signUp(email: 'nonnyesodo@gmail.com', password: 'securepassword');

    log("user ${response.user}");
  }

  loginUser() async {
    try {
      final response = await supabase.auth.signInWithPassword(
          email: 'nonnyesodo@gmail.com', password: 'securepassword');
      log("user ${response.user}");
    } catch (e) {
      log(e.toString());
    }
  }
}
