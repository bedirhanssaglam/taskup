import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/product/components/text/locale_text.dart';
import 'package:task_management/product/init/localization/locale_keys.g.dart';
import 'package:task_management/product/state/product_provider_items.dart';
import 'package:task_management/product/utility/border_radius/app_border_radius.dart';
import 'package:task_management/product/utility/extensions/context_extensions.dart';
import 'package:task_management/product/utility/paddings/app_paddings.dart';
import 'package:task_management/product/utility/task_filter_helper.dart';
import 'package:widget/widget.dart';

part 'mixin/filter_bottom_sheet_mixin.dart';

final class FilterBottomSheet extends ConsumerStatefulWidget {
  const FilterBottomSheet({
    required this.initialCriteria,
    super.key,
  });

  final FilterCriteria initialCriteria;

  static Future<FilterCriteria?> show(
    BuildContext context,
    FilterCriteria initialCriteria,
  ) async {
    return BottomSheetBase.show<FilterCriteria>(
      context: context,
      builder: (context) => FilterBottomSheet(initialCriteria: initialCriteria),
    );
  }

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet>
    with _FilterBottomSheetMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const AppBorderRadius.onlyTop(),
      child: Container(
        height: 325.w,
        width: 1.sw,
        padding: const AppPadding.largeAll(),
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: const AppBorderRadius.onlyTop(),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocaleText(
                LocaleKeys.filter_filterOptions,
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<FilterCriteria>(
                valueListenable: filterCriteriaNotifier,
                builder: (context, value, child) {
                  return Column(
                    children: FilterCriteria.values.map(
                      (FilterCriteria criteria) {
                        return RadioListTile<FilterCriteria>(
                          title: LocaleText(criteria.reference),
                          value: criteria,
                          groupValue: value,
                          onChanged: (FilterCriteria? newValue) {
                            if (newValue != null) {
                              ref
                                  .read(
                                    ProductProviderItems
                                        .filterCriteriaProvider.notifier,
                                  )
                                  .updateFilterCriteria(newValue);
                              Navigator.pop(context, newValue);
                            }
                          },
                        );
                      },
                    ).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
