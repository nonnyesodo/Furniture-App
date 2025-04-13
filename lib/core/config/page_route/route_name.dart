enum RouteName {
  splash('/'),
  login('/login'),
  auth('/auth'),
  botomNav('/bottom_nav'),
  addProduct('/add_product'),
  arView('/ar_view'),
  productDetail('/produt_detail');

  final String path;

  const RouteName(this.path);
}
