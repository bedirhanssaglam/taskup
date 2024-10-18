import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/feature/auth/onboarding/view_model/onboarding_view_model.dart';

void main() {
  group('OnboardingViewModel Tests', () {
    late OnboardingViewModel viewModel;

    setUp(() {
      viewModel = OnboardingViewModel(3);
    });

    test('Initial state is 0', () {
      expect(viewModel.state, 0);
    });

    test('Next page increments state', () {
      viewModel.nextPage();
      expect(viewModel.state, 1);

      viewModel.nextPage();
      expect(viewModel.state, 2);
    });

    test('Next page does not exceed totalPages - 1', () {
      viewModel
        ..nextPage()
        ..nextPage()
        ..nextPage();
      expect(viewModel.state, 2);
    });

    test('Previous page decrements state', () {
      viewModel.nextPage();
      expect(viewModel.state, 1);

      viewModel.previousPage();
      expect(viewModel.state, 0);
    });

    test('Previous page does not go below 0', () {
      viewModel.previousPage();
      expect(viewModel.state, 0);
    });

    test('SetPage changes state to a valid index', () {
      viewModel.setPage(1);
      expect(viewModel.state, 1);

      viewModel.setPage(2);
      expect(viewModel.state, 2);
    });

    test('SetPage does not change state for invalid index', () {
      viewModel.setPage(3);
      expect(viewModel.state, 0);

      viewModel.setPage(-1);
      expect(viewModel.state, 0);
    });
  });
}
