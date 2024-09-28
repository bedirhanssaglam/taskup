import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management/feature/main/view_model/main_view_model.dart';

class MockPageController extends Mock implements PageController {}

void main() {
  group('MainViewModel', () {
    late ProviderContainer container;
    late MainViewModel viewModel;

    setUp(() {
      container = ProviderContainer();
      viewModel = MainViewModel();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is 0', () {
      expect(viewModel.state, 0);
    });

    test('reset sets state back to 0', () {
      viewModel.changePage(2);
      viewModel.reset();
      expect(viewModel.state, 0);
    });
  });
}
