import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:hasad_app/features/filter/presentation/components/base/base_drop_down.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class AgricultureFilter extends StatelessWidget {
  const AgricultureFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseFilter(
        title: LocaleKeys.cropType.tr(), type: "agriculture-type", onOptionSelected: (value) {});
  }
}
