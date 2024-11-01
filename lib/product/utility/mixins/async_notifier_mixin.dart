import 'package:flutter/foundation.dart' show AsyncValueGetter;
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin AsyncNotifierMixin<T> on AutoDisposeNotifier<AsyncValue<T>> {
  Future<void> loadingAndGuard(AsyncValueGetter<T> asyncFunction) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(asyncFunction);
  }
}
