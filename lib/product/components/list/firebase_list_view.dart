import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

typedef FireStoreGeneralBuilder<T> = Widget Function(
  BuildContext context,
  T model,
);

@immutable
final class GeneralFirestoreListView<T> extends StatelessWidget {
  const GeneralFirestoreListView({
    required this.query,
    required this.itemBuilder,
    required this.onRetry,
    required this.emptyBuilder,
    this.shrinkWrap = false,
    this.reverse = false,
    super.key,
  });

  final bool shrinkWrap;
  final Query<T?> query;
  final FireStoreGeneralBuilder<T> itemBuilder;
  final VoidCallback onRetry;
  final Widget Function(BuildContext context) emptyBuilder;

  final bool reverse;
  @override
  Widget build(BuildContext context) {
    return FirestoreListView<T?>(
      query: query,
      shrinkWrap: shrinkWrap,
      reverse: reverse,
      physics: const ClampingScrollPhysics(),
      loadingBuilder: (_) => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      emptyBuilder: emptyBuilder,
      itemBuilder: (context, doc) {
        final model = doc.data();
        if (model == null) return const SizedBox.shrink();
        return itemBuilder.call(context, model);
      },
    );
  }
}
