import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/custom_drop_down.dart';
import 'package:hasad_app/common/default/empty_list.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/filter/presentation/components/base/custom_drop_down.dart';
import 'package:hasad_app/features/lists/presentation/controller/cubit/lists_cubit.dart';

class BaseFilter extends StatelessWidget {
  const BaseFilter(
      {super.key, required this.title, required this.type, required this.onOptionSelected});
  final String title;
  final String type;
  final void Function(OptionItem?) onOptionSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<ListsCubit>()..getUnKnownList(type),
        child: BlocBuilder<ListsCubit, ListsState>(
          builder: (context, state) {
            ListsCubit listCubit = ListsCubit.get(context);
            if (state is GetUnKnownListLoadingState) {
              return const LoadingWidget();
            }
            if (listCubit.unKnownList.isEmpty) {
              return const EmptyList();
            }
            return FilterDropDown(
                title: title,
                list: listCubit.unKnownList
                    .map((e) => OptionItem(id: e.id.toString(), title: e.name!))
                    .toList(),
                hint: title,
                onOptionSelected: onOptionSelected);
          },
        ));
  }
}
