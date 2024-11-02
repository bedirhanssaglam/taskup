import 'dart:math' show pi;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/feature/dashboard/view/widgets/indicator.dart';
import 'package:task_management/feature/dashboard/view/widgets/pie_chart_widget.dart';
import 'package:task_management/feature/dashboard/view_model/dashboard_state.dart';
import 'package:task_management/feature/dashboard/view_model/dashboard_view_model.dart';
import 'package:task_management/product/components/animation/animated_view.dart';
import 'package:task_management/product/components/dialog/productivity_dialog.dart';
import 'package:task_management/product/components/loading/app_loading.dart';
import 'package:task_management/product/components/tap_area/tap_area.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/enums/task_statistics.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/image_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/extensions/task_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';

part './mixin/dashboard_view_mixin.dart';
part './widgets/dashboard_appbar.dart';
part './widgets/productivity_widget.dart';
part './widgets/stats_card.dart';
part './widgets/summary_card.dart';
part './widgets/task_statistics.dart';
part './widgets/task_summaries.dart';

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
              final totalTaskCount = state.tasks?.length ?? 0;

              final percentage = totalTaskCount > 0
                  ? (completedCount / totalTaskCount) * 100
                  : 0.0;
              return AnimatedView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LocaleText(
                      LocaleKeys.dashboard_taskSummary,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    WidgetSizes.spacingM.verticalSpace,
                    _TaskSummaries(
                      doingCount: doingCount,
                      upcomingCount: upcomingCount,
                      overdueCount: overdueCount,
                      completedCount: completedCount,
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
                        Container(
                          height: .40.sw,
                          width: .45.sw,
                          padding: const AppPadding.mediumAll(),
                          decoration: BoxDecoration(
                            color: context.colorScheme.outlineVariant,
                            borderRadius: AppBorderRadius.circularBig(),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LocaleText(
                                    LocaleKeys.dashboard_productivity,
                                    style: context.textTheme.bodyMedium,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      ProductivityDialog.show(context);
                                    },
                                    icon: const Icon(Icons.info_outline),
                                  ),
                                ],
                              ),
                              ProductivityWidget(percent: percentage),
                            ],
                          ),
                        ),
                        _StatCard(
                          title: LocaleKeys.dashboard_totalTaskActivity,
                          value: state.tasks?.length.toString() ?? '0',
                          percentage: '50%',
                          color: TaskStatistics.inProgress.color,
                        ),
                      ],
                    ),
                  ],
                ),
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
