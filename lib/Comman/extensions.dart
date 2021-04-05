import 'package:dawey/Comman/ui_config.dart';

extension UIConfigAspect on double {
  double toWidth() {
    return UIConfig.getWidth(this);
  }

  double toHeight() {
    return UIConfig.getHeight(this);
  }
}

extension UIConfigAspectInt on int {
  double toWidth() {
    return UIConfig.getWidth(this.toDouble());
  }

  double toHeight() {
    return UIConfig.getHeight(this.toDouble());
  }
}
