import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/feature/home/view/widgets/task_card.dart';
import 'package:task_management/feature/home/view_model/home_state.dart';
import 'package:task_management/feature/home/view_model/home_view_model.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/view/add_task_sheet.dart';
import 'package:task_management/product/components/bottom_sheet/filter/view/filter_bottom_sheet.dart';
import 'package:task_management/product/components/loading/app_loading.dart';
import 'package:task_management/product/components/shimmer/shimmer_effect.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/state/product_provider_items.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';
import 'package:task_management/product/utility/task_filter_helper.dart';

part './mixin/home_view_mixin.dart';
part './widgets/add_task_button.dart';
part './widgets/empty_task_widget.dart';
part './widgets/home_app_bar.dart';
part './widgets/home_list_shimmer.dart';
part './widgets/home_task_list.dart';

final class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with _HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _HomeAppBar(
        userFullName: userFullName,
        onFilterTapped: showFilterBottomSheet,
        onLogoutTapped: () =>
            ref.read(ProductProviderItems.authServiceProvider).logOut,
      ),
      body: Column(
        children: [
          Expanded(
            child: homeState.when(
              data: (state) {
                if (state.tasks?.isEmpty ?? true) {
                  return const _EmptyTaskWidget();
                }
                return Consumer(
                  builder: (context, ref, child) {
                    final filterCriteria =
                        ref.watch(ProductProviderItems.filterCriteriaProvider);
                    return _HomeTaskList(
                      tasks: state.tasks,
                      filterCriteria: filterCriteria,
                    );
                  },
                );
              },
              loading: AppLoading.new,
              error: (error, stack) => Center(
                child: Text(error.toString().locale),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const _AddTaskButton(),
    );
  }
}
