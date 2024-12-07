import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/shared_tabbar.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/common/user_image.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/bidding/all/presentation/components/my_bidding_list.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/my_bidding_list/cubit/my_bidding_list_cubit.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/components/my_direct_selling_list.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/my_direct_selling_list/cubit/my_direct_selling_list_cubit.dart';
import 'package:hasad_app/features/users_search/domain/models/user_data_model.dart';
import 'package:hasad_app/features/users_search/presentation/controller/cubit/users_search_cubit.dart';
import 'package:hasad_app/utils/helpers.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UsersSearchCubit>()..getUsers(userId),
      child: BlocBuilder<UsersSearchCubit, UsersSearchState>(
        builder: (context, state) {
          UsersSearchCubit cubit = UsersSearchCubit.get(context);
          UserProfileModel? model =
              (cubit.usersModel?.data == null || cubit.usersModel!.data!.isEmpty)
                  ? null
                  : cubit.usersModel?.data?[0];
          print(".....${"${Constants.imagesUrl}uploads${model?.image ?? ""}"}");
          return DefaultTabController(
            length: 2,
            child: DefaultScaffold(
                body: state is GetUsersLoadingState
                    ? const LoadingWidget()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserImageWidget(imageUrl: model?.image, radius: 40.sp),
                          const SizedBox(height: 10),

                          TitleWidget(title: isEmpty(model?.name)),
                          const SizedBox(height: 10),
                          SubTitleWidget(
                              subTitle: model?.phone != null
                                  ? !model!.phone.toString().startsWith("0")
                                      ? "0${model.phone.toString()}"
                                      : model.phone.toString()
                                  : ""),
                          if (model?.email != null) SubTitleWidget(subTitle: isEmpty(model?.email)),
                          SizedBox(height: 20.h),
                          //////////////////
                          const SharedTabBar(),
                          SizedBox(height: 20.h),
                          Expanded(
                              child: TabBarView(children: [
                            BlocProvider(
                              create: (context) =>
                                  sl<MyBiddingListCubit>()..getBiddingList(userId: userId),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: MyBiddingListView(userId: userId),
                              ),
                            ),
                            BlocProvider(
                              create: (context) => sl<MyDirectSellingListCubit>()
                                ..getDirectSellingList(userId: userId),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: MyDirectSellingListView(userId: userId),
                              ),
                            )
                          ]))
                        ],
                      )),
          );
        },
      ),
    );
  }
}
