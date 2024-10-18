import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/feature/auth/onboarding/view_model/onboarding_view_model.dart';
import 'package:task_management/product/components/button/app_text_button.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/constants/app_constants.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/init/navigation/app_navigation.dart';
import 'package:task_management/product/state/providers/auth_provider_items.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/image_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

part './mixin/onboarding_view_mixin.dart';
part './widgets/onboarding_footer.dart';
part './widgets/onboarding_page_view.dart';

final class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView>
    with _OnboardingViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: _OnboardingPageView(
              pageController: _pageController,
              onPageChanged: setPage,
            ),
          ),
          _OnboardingFooter(
            currentPage: currentPage,
            nextPage: nextPage,
            previousPage: previousPage,
          ),
        ],
      ),
    );
  }
}
