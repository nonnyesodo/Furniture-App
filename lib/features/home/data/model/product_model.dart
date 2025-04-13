class ProductModel {
  int? id;
  String? createdAt;
  String? productName;
  String? price;
  String? productDecription;
  String? productCategory;
  String? imageUrl;
  String? userId;

  ProductModel(
      {this.id,
      this.createdAt,
      this.productName,
      this.price,
      this.productDecription,
      this.productCategory,
      this.imageUrl,
      this.userId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    productName = json['product_name'];
    price = json['price'];
    productDecription = json['product_decription'];
    productCategory = json['product_category'];
    imageUrl = json['image_url'];
    userId = json['user_id'];
  }
}
