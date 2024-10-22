import 'package:gen/gen.dart';

final class OnboardingItem {
  const OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final AssetGenImage imagePath;
  final String title;
  final String description;
}
