import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/feature/dashboard/view/widgets/indicator.dart';
import 'package:task_management/feature/dashboard/view/widgets/pie_chart_widget.dart';
import 'package:task_management/feature/dashboard/view_model/dashboard_state.dart';
import 'package:task_management/feature/dashboard/view_model/dashboard_view_model.dart';
import 'package:task_management/product/components/loading/app_loading.dart';
import 'package:task_management/product/components/tap_area/tap_area.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/extensions/task_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

part './mixin/dashboard_view_mixin.dart';
part './widgets/dashboard_appbar.dart';
part './widgets/stats_card.dart';
part './widgets/summary_card.dart';
part './widgets/task_statistics.dart';

final class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView>
    with _DashboardViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _DashboardAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const AppPadding.mediumAll(),
          child: dashboardState.when(
            data: (state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LocaleText(
                    LocaleKeys.dashboard_taskSummary,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  WidgetSizes.spacingM.verticalSpace,
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.4 / 1,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _SummaryCard(
                        title: LocaleKeys.dashboard_inProgress,
                        count: doingCount,
                        color: const Color(0xFF6C63FF),
                        onTap: () {},
                      ),
                      _SummaryCard(
                        title: LocaleKeys.dashboard_thingsToDo,
                        count: upcomingCount,
                        color: const Color(0xFFEA7C30),
                        onTap: () {},
                      ),
                      _SummaryCard(
                        title: LocaleKeys.dashboard_pastDates,
                        count: overdueCount,
                        color: const Color(0xFFEB5757),
                        onTap: () {},
                      ),
                      _SummaryCard(
                        title: LocaleKeys.dashboard_completed,
                        count: completedCount,
                        color: const Color(0xFF27AE60),
                        onTap: () {},
                      ),
                    ],
                  ),
                  WidgetSizes.spacingL.verticalSpace,
                  LocaleText(
                    LocaleKeys.dashboard_taskStatistics,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const AppPadding.bigAll(),
                    margin: const AppPadding.bigVertical(),
                    decoration: BoxDecoration(
                      color: context.colorScheme.outlineVariant,
                      borderRadius: AppBorderRadius.circularBig(),
                    ),
                    child: _TaskStatistics(
                      completedCount: completedCount,
                      inProgressCount: doingCount,
                      overdueCount: overdueCount,
                      upcomingCount: upcomingCount,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const _StatCard(
                        title: LocaleKeys.dashboard_totalWorkingHour,
                        value: '50:25:06',
                        percentage: '34%',
                        color: Color(0xFF27AE60),
                      ),
                      _StatCard(
                        title: LocaleKeys.dashboard_totalTaskActivity,
                        value: state.tasks?.length.toString() ?? '0',
                        percentage: '50%',
                        color: const Color(0xFF6C63FF),
                      ),
                    ],
                  ),
                ],
              );
            },
            loading: AppLoading.new,
            error: (error, stack) => Center(
              child: Text(error.toString().locale),
            ),
          ),
        ),
      ),
    );
  }
}
