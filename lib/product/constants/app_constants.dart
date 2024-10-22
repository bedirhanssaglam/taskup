import 'package:flutter/foundation.dart' show immutable;
import 'package:gen/gen.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/onboarding_item.dart';

@immutable
abstract final class AppConstants {
  static const String appName = 'Travely';
  static const String genPackageName = 'gen';

  static const String emailHint = 'example@gmail.com';
  static const String passwordHint = '***********';

  static final List<OnboardingItem> onboardingItems = <OnboardingItem>[
    OnboardingItem(
      imagePath: Assets.images.tasks,
      title: LocaleKeys.onboarding_letsGetStarted,
      description: LocaleKeys.onboarding_discoverOurApp,
    ),
    OnboardingItem(
      imagePath: Assets.images.success,
      title: LocaleKeys.onboarding_reachYourGoals,
      description: LocaleKeys.onboarding_planningBringsSuccess,
    ),
    OnboardingItem(
      imagePath: Assets.images.work,
      title: LocaleKeys.onboarding_theArtOfTimeManagement,
      description: LocaleKeys.onboarding_effectiveTimeManagement,
    ),
    OnboardingItem(
      imagePath: Assets.images.motivation,
      title: LocaleKeys.onboarding_keepYourMotivationHigh,
      description: LocaleKeys.onboarding_progressFuelsMotivation,
    ),
    OnboardingItem(
      imagePath: Assets.images.pomodoro,
      title: LocaleKeys.onboarding_pomodoro,
      description: LocaleKeys.onboarding_concentrationBreedsPerfection,
    ),
  ];
}
