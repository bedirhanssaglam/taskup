import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/feature/home/view/mixin/home_view_mixin.dart';
import 'package:task_management/feature/home/view_model/home_view_model.dart';
import 'package:task_management/product/base/model/note.dart';

final class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static Page<void> view() => const MaterialPage<void>(child: HomeView());

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          homeState.when(
            data: (HomeState data) {
              final List<Task>? tasks = data.tasks;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: tasks?.length,
                itemBuilder: (context, index) => Text(tasks?[index].title ?? ''),
              );
            },
            error: (error, _) => Text(error.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ],
      ),
    );
  }
}
