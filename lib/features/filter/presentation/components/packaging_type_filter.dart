import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:hasad_app/features/filter/presentation/components/base/base_drop_down.dart';
import 'package:hasad_app/features/filter/presentation/controller/cubit/filter_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class PackagingFilter extends StatelessWidget {
  const PackagingFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseFilter(
        title: LocaleKeys.packagingType.tr(),
        type: "packaging-type",
        onOptionSelected: (value) {
          FilterCubit.get(context).packagingTypeId = value?.id;
        });
  }
}
