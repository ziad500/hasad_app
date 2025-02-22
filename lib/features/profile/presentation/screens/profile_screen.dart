import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_button.dart';

import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/common/user_image.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/auth/data/network/auth_requests.dart';
import 'package:hasad_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:hasad_app/features/layout/cubit/layout_cubit.dart';
import 'package:hasad_app/features/profile/domain/models/profile_model.dart';
import 'package:hasad_app/features/profile/presentation/components/settings_item.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/language_manager.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ProfileDataModel? model = ProfileCubit.get(context).profileDataModel;
        return DefaultScaffold(
          leadingWidth: 0,
          appbarLeading: const SizedBox(),
          back: false,
          body: Column(
            children: [
              state is GetProfileDataLoadingState
                  ? const LinearProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : _UserRow(ProfileCubit.get(context).profileDataModel),
              const DefaultDivider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50, top: 20),
                    child: DefaultListView(
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                if (index == 0) {
                                  ProfileCubit.get(context).getProfileData();
                                }
                                if (_settingsList(context)[index].func != null) {
                                  _settingsList(context)[index].func!(context);
                                } else {
                                  Navigator.pushNamed(context, _settingsList(context)[index].route,
                                      arguments: _settingsList(context)[index].arguments);
                                }
                              },
                              child: SettingsItem(
                                  icon: _settingsList(context)[index].icon,
                                  title: _settingsList(context)[index].title,
                                  balance: index == 0 ? "${model?.balance ?? ""}" : null,
                                  iconWidget: _settingsList(context)[index].iconWidget,
                                  color: _settingsList(context)[index].color,
                                  pendingBalance:
                                      index == 0 ? "${model?.reservedBalance ?? ""}" : null),
                            ),
                        count: _settingsList(context).length),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _UserRow extends StatelessWidget {
  const _UserRow(this.profileDataModel);
  final ProfileDataModel? profileDataModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          UserImageWidget(imageUrl: profileDataModel?.image),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(title: isEmpty(profileDataModel?.name)),
              const SizedBox(
                height: 10,
              ),
              SubTitleWidget(
                  subTitle: profileDataModel?.phone != null
                      ? !profileDataModel!.phone!.toString().startsWith("0")
                          ? "0${profileDataModel?.phone.toString() ?? ""}"
                          : profileDataModel?.phone.toString() ?? ""
                      : "")
            ],
          )),
          InkWell(
            onTap: () => Navigator.pushNamed(context, Routes.profileQrCodeScreen, arguments: {
              "qrData": profileDataModel?.id.toString(),
              "profileDataModel": profileDataModel
            }),
            child: const Icon(
              Icons.qr_code_2,
              color: AppColors.blue,
              size: 40,
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              ProfileCubit.get(context).profileImage = null;
              ProfileCubit.get(context).setController();
              Navigator.pushNamed(context, Routes.editProfileRoutes);
            },
            child: Column(
              children: [
                const Icon(
                  Icons.settings_outlined,
                  color: AppColors.blue,
                ),
                SubTitleWidget(
                  subTitle: LocaleKeys.edit.tr(),
                  color: AppColors.blue,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<_SettingsModel> _settingsList(context) => [
      _SettingsModel(
          icon: SVGManager.wallet, title: LocaleKeys.wallet.tr(), route: Routes.walletScreenRoutes),
      _SettingsModel(
          icon: SVGManager.ads, title: LocaleKeys.ads.tr(), route: Routes.myAdvertisementScreen),
      _SettingsModel(
          icon: SVGManager.note, title: LocaleKeys.orders.tr(), route: Routes.myOrdersScreen),
      _SettingsModel(
          icon: SVGManager.note,
          title: LocaleKeys.payRequests.tr(),
          route: Routes.salesOrdersScreen),
      _SettingsModel(
          icon: SVGManager.bid,
          title: LocaleKeys.biddingRequests.tr(),
          route: Routes.biddingRequestsScreen,
          arguments: {"id": null}),
      _SettingsModel(
          icon: SVGManager.heart, title: LocaleKeys.favorites.tr(), route: Routes.favoritesRoutes),
      _SettingsModel(
          iconWidget: const Icon(Icons.language, weight: 0.5, color: Colors.white),
          icon: "",
          title: Constants.isArabic ? "English" : "العربية",
          func: (p0) => LanguageManager.changeAppLanguage(context),
          route: ""),
      _SettingsModel(
          icon: SVGManager.flag, title: LocaleKeys.aboutHarvest.tr(), route: Routes.aboutAppRoutes),
      _SettingsModel(
          icon: SVGManager.archive,
          title: LocaleKeys.termsOfUse.tr(),
          route: Routes.termsAndConditionsScreen,
          arguments: {"title": LocaleKeys.termsOfUse.tr()}),
      _SettingsModel(
          icon: SVGManager.shield,
          title: LocaleKeys.privacyPolicy.tr(),
          route: Routes.termsAndConditionsScreen,
          arguments: {"title": LocaleKeys.privacyPolicy.tr()}),
      _SettingsModel(
          color: AppColors.red,
          icon: SVGManager.shield,
          title: Constants.isArabic ? "تسجيل الخروج" : "Logout",
          iconWidget: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          func: (context) async {
            LoginCubit.get(context).userLogOut(LogOutRequest());
            Constants.token = "";
            LayoutCubit.get(context).changeScreen(0);
            //    Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoutes, (route) => false);
          },
          route: ""),
      _SettingsModel(
          color: AppColors.red,
          icon: SVGManager.lock,
          title: LocaleKeys.deleteAccount.tr(),
          iconWidget: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          func: (context) async {
            showDialog(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => sl<LoginCubit>(),
                  child: BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is UserDeleteSuccessState) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.loginRoutes, (route) => false);
                      }
                    },
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TitleWidget(
                                    title: LocaleKeys.deleteAccount.tr(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(height: 15),
                                  SubTitleWidget(subTitle: LocaleKeys.deleteAccountHint.tr()),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                          child: DefaultButton(
                                              buttonName: LocaleKeys.cancel.tr(),
                                              buttonFunction: () => Navigator.pop(context))),
                                      const SizedBox(width: 15),
                                      Expanded(
                                          child: DefaultButton(
                                              color: Colors.red,
                                              isLoading: state is UserDeleteLoadingState,
                                              buttonName: LocaleKeys.deleteAccount.tr(),
                                              buttonFunction: () {
                                                LoginCubit.get(context).deleteAccount();
                                              })),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          route: ""),
    ];

class _SettingsModel {
  String icon;
  String title;
  String route;
  dynamic arguments;
  Widget? iconWidget;
  Function(BuildContext)? func;
  final Color? color;

  _SettingsModel({
    required this.icon,
    required this.title,
    required this.route,
    this.arguments,
    this.iconWidget,
    this.func,
    this.color,
  });
}
