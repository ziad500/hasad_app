import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/bidding_requests/presentation/components/bidding_requests_list.dart';
import 'package:hasad_app/features/bidding_requests/presentation/controller/bidding_requests_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class BiddingRequestsScreen extends StatelessWidget {
  const BiddingRequestsScreen({super.key, this.advertismentId});
  final String? advertismentId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BiddingRequestsCubit>()..getBiddingRequestsList(advertismentId),
      child: DefaultScaffold(
          appbarTitle: LocaleKeys.biddingRequests.tr(),
          body: Padding(
              padding: const EdgeInsets.all(20),
              child: BiddingRequestsListView(
                expanded: false,
                advertismentId: advertismentId,
              ))),
    );
  }
}
