import 'package:augmented_reality_plugin/augmented_reality_plugin.dart';

import 'package:medical_app/global_widget/export.dart';

class ArView extends StatelessWidget {
  const ArView({super.key, required this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return AugmentedRealityPlugin(image ??
        'https://www.freepnglogos.com/uploads/furniture-png/furniture-png-transparent-furniture-images-pluspng-15.png');
  }
}
