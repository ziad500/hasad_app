import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/sales_order/presentation/components/sales_orders_list.dart';
import 'package:hasad_app/features/sales_order/presentation/controller/sales_orders_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class SalesOrdersScreen extends StatelessWidget {
  const SalesOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SalesOrdersCubit>()..getSalesOrdersList(),
      child: DefaultScaffold(
          appbarTitle: LocaleKeys.payRequests.tr(),
          body: const Padding(
              padding: EdgeInsets.all(20), child: SalesOrdersListView(expanded: false))),
    );
  }
}
