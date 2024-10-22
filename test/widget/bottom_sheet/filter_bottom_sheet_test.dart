import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/product/components/bottom_sheet/filter/view/filter_bottom_sheet.dart';
import 'package:task_management/product/components/bottom_sheet/filter/view_model/filter_view_model.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/state/providers/product_provider_items.dart';
import 'package:task_management/product/utility/task_filter_helper.dart';
import 'package:widget/widget.dart';

import '../../finder_match_extensions.dart';

void main() {
  Widget createTestableWidget(Widget child) {
    return ProviderScope(
      child: AppResponsive(
        child: MaterialApp(
          home: child,
        ),
      ),
    );
  }

  testWidgets('FilterBottomSheet shows initial criteria', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      createTestableWidget(
        const FilterBottomSheet(initialCriteria: FilterCriteria.dateDesc),
      ),
    );

    find.text(LocaleKeys.filter_dateDesc).once();
  });

  testWidgets('Selecting a new filter criteria updates the view', (
    WidgetTester tester,
  ) async {
    final filterViewModel = FilterViewModel();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          ProductProviderItems.filterCriteriaProvider.overrideWith(
            (ref) => filterViewModel,
          ),
        ],
        child: const AppResponsive(
          child: MaterialApp(
            home: FilterBottomSheet(initialCriteria: FilterCriteria.dateDesc),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(RadioListTile<FilterCriteria>).first);
    await tester.pumpAndSettle();

    find.text(LocaleKeys.filter_dateDesc).never();
  });
}
