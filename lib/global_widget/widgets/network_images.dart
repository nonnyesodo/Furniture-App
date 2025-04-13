import 'package:medical_app/global_widget/export.dart';

import '../../core/res/theme/assets.dart';

class AppNetwokImage extends StatelessWidget {
  const AppNetwokImage(
      {super.key,
      required this.height,
      required this.width,
      this.fit,
      required this.imageUrl,
      this.radius});
  final double height, width;
  final BoxFit? fit;
  final String imageUrl;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return imageUrl == ''
        ? ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0),
            child: Image.asset(AppAssets.splash1,
                width: width, height: height, fit: BoxFit.fill))
        : ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0),
            child: CachedNetworkImage(
                width: width,
                height: height,
                fit: fit,
                imageUrl: imageUrl,
                placeholder: (context, url) => ClipRRect(
                    borderRadius: BorderRadius.circular(radius ?? 0),
                    child: Image.asset(AppAssets.splash1,
                        width: width, height: height, fit: fit)),
                errorWidget: (context, url, error) => ClipRRect(
                    borderRadius: BorderRadius.circular(radius ?? 0),
                    child: Image.asset(AppAssets.splash1,
                        width: width, height: height, fit: fit))));
  }
}
