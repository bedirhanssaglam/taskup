// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:task_management/feature/tasks/view_model/task_state.dart';
import 'package:task_management/feature/tasks/view_model/task_view_model.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/view/add_task_sheet.dart';
import 'package:task_management/product/components/bottom_sheet/filter/view/filter_bottom_sheet.dart';
import 'package:task_management/product/components/shimmer/shimmer_effect.dart';
import 'package:task_management/product/components/task/task_card.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/init/navigation/app_navigation.dart';
import 'package:task_management/product/models/task.dart';
import 'package:task_management/product/models/update_task_data.dart';
import 'package:task_management/product/state/providers/auth_provider_items.dart';
import 'package:task_management/product/state/providers/product_provider_items.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/string_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/size/widget_sizes.dart';
import 'package:task_management/product/utility/task_filter_helper.dart';

part './mixin/task_view_mixin.dart';
part './widgets/add_task_button.dart';
part './widgets/empty_task_widget.dart';
part './widgets/task_app_bar.dart';
part './widgets/task_list.dart';
part './widgets/task_list_shimmer.dart';

final class TaskView extends ConsumerStatefulWidget {
  const TaskView({super.key});

  @override
  ConsumerState<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends ConsumerState<TaskView> with _TaskViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _TaskAppBar(
        onFilterTapped: showFilterBottomSheet,
        onLogoutTapped: () async {
          await logOut();
          await Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.starting,
            (route) => false,
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: taskState.when(
              data: (state) {
                if (state.tasks?.isEmpty ?? true) {
                  return const _EmptyTaskWidget();
                }
                return Consumer(
                  builder: (context, ref, child) {
                    final filterCriteria =
                        ref.watch(ProductProviderItems.filterCriteriaProvider);
                    return _TaskList(
                      tasks: state.tasks,
                      filterCriteria: filterCriteria,
                      onDelete: deleteTask,
                      onMarkAsDone: (task) => updateTask(updateTaskData: task),
                      onMarkAsProgress: (task) =>
                          updateTask(updateTaskData: task),
                    );
                  },
                );
              },
              loading: _TaskListShimmer.new,
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
