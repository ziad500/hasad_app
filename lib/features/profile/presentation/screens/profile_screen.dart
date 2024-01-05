// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/common/user_image.dart';
import 'package:hasad_app/features/profile/domain/models/profile_model.dart';
import 'package:hasad_app/features/profile/presentation/components/settings_item.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/helpers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return DefaultScaffold(
          body: Column(
            children: [
              _UserRow(ProfileCubit.get(context).profileDataModel),
              const DefaultDivider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50, top: 20),
                    child: DefaultListView(
                        itemBuilder: (context, index) => SettingsItem(
                            icon: _settingsList()[index].icon, title: _settingsList()[index].title),
                        count: _settingsList().length),
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
              SubTitleWidget(subTitle: isEmpty(profileDataModel?.phone))
            ],
          )),
          const Column(
            children: [
              Icon(
                Icons.settings_outlined,
                color: AppColors.blue,
              ),
              SubTitleWidget(
                subTitle: "تعديل",
                color: AppColors.blue,
              )
            ],
          )
        ],
      ),
    );
  }
}

List<_SettingsModel> _settingsList() => [
      _SettingsModel(icon: SVGManager.wallet, title: "المحفظة"),
      _SettingsModel(icon: SVGManager.ads, title: "الإعلانات"),
      _SettingsModel(icon: SVGManager.note, title: "الطلبات"),
      _SettingsModel(icon: SVGManager.heart, title: "المفضلة"),
      _SettingsModel(icon: SVGManager.flag, title: "عن حصاد"),
      _SettingsModel(icon: SVGManager.archive, title: "سياسة الإستخدام"),
      _SettingsModel(icon: SVGManager.shield, title: "سياسة الخصوصية")
    ];

List<String> _titleList() => [];

class _SettingsModel {
  String icon;
  String title;
  _SettingsModel({
    required this.icon,
    required this.title,
  });
}
