import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/bidding/details/presentation/controller/cubit/bidding_details_cubit.dart';
import 'package:hasad_app/features/bidding_requests/presentation/components/bidding_requests_list.dart';

import '../../../../../core/di.dart';
import '../../../../bidding_requests/presentation/controller/bidding_requests_cubit.dart';

class BiddingRequestsList extends StatefulWidget {
  const BiddingRequestsList({super.key, required this.advertismentId});
  final String advertismentId;

  @override
  State<BiddingRequestsList> createState() => _BiddingRequestsListState();
}

class _BiddingRequestsListState extends State<BiddingRequestsList> {
  ValueNotifier<bool> isRefresh = ValueNotifier(false);
  _refresh() {
    isRefresh.value = true;
    Future.delayed(const Duration(milliseconds: 300)).then((e) {
      isRefresh.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  _refresh();
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        ValueListenableBuilder(
            valueListenable: isRefresh,
            builder: (context, value, child) {
              if (value) {
                return const SizedBox();
              }
              return BlocProvider(
                create: (context) =>
                    sl<BiddingRequestsCubit>()..getBiddingRequestsList(widget.advertismentId),
                child: BiddingRequestsListView(
                  expanded: false,
                  advertismentId: widget.advertismentId,
                  func: () {
                    BiddingDetailsCubit.get(context).getBiddingDetails(widget.advertismentId);
                    _refresh();
                  },
                ),
              );
            }),
      ],
    );
  }
}
