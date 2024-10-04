import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen/gen.dart';
import 'package:task_management/feature/home/view/mixin/home_view_mixin.dart';
import 'package:task_management/feature/home/view/widgets/task_card.dart';
import 'package:task_management/product/base/model/note.dart';
import 'package:task_management/product/components/bottom_sheet/add_task/view/add_task_sheet.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/state/product_provider_items.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/extensions/task_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';

part './widgets/add_task_button.dart';
part './widgets/empty_task_widget.dart';
part 'widgets/home_task_list.dart';

final class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello Bedirhan!',
          style: context.textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed:
                ref.read(ProductProviderItems.authServiceProvider).logOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: homeState.when(
        data: (state) {
          if (state.tasks?.isEmpty ?? true) {
            return const _EmptyTaskWidget();
          }
          return _HomeTaskList(tasks: state.tasks);
        },
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
      floatingActionButton: const _AddTaskButton(),
    );
  }
}
