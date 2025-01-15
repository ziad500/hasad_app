import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/default/empty_list.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:hasad_app/features/wallet/presentation/components/cashback_card.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

class CashBackSection extends StatelessWidget {
  const CashBackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
          title: LocaleKeys.cashBack.tr(),
          size: 14.sp,
          color: AppColors.addRequestContainerColor,
        ),
        const DefaultDivider(indent: 20),
        const SizedBox(height: 16),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            ProfileCubit cubit = ProfileCubit.get(context);
            if (state is GetProfileDataLoadingState) {
              return const LoadingWidget();
            } else if (cubit.profileDataModel?.cashback == null ||
                cubit.profileDataModel!.cashback!.isEmpty) {
              return const EmptyList();
            } else if (cubit.profileDataModel!.cashback!.isNotEmpty) {
              return DefaultListView(
                  itemBuilder: (p0, index) =>
                      CashBackCard(cashBackModel: cubit.profileDataModel!.cashback![index]),
                  count: cubit.profileDataModel!.cashback!.length);
            }
            return const EmptyList();
          },
        )
      ],
    );
  }
}
