abstract class AppImages {
  String get appLogo;
}

class AppImagesImpl implements AppImages {
  @override
  String get appLogo => "assets/images/logo.png";
}
