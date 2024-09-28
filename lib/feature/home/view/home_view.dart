import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen/gen.dart';
import 'package:task_management/feature/home/view/mixin/home_view_mixin.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/extensions/icon_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';

part './widgets/add_task_button.dart';
part './widgets/empty_task_widget.dart';

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
      ),
      body: const Padding(
        padding: AppPadding.normalHorizontal(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _EmptyTaskWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: const _AddTaskButton(),
    );
  }
}
