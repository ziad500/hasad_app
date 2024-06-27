import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/default/show_modal_bottom_sheet.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/default/user_image.dart';
import 'package:hasad_app/common/icons/call_icon.dart';
import 'package:hasad_app/common/icons/stc_icon.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/features/profile/presentation/components/change_password_bottomsheet.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/validation.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is EditProfileDataErrorState) {
          showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
        }
        if (state is EditProfileDataSuccessState) {
          showSnackbar(
              context: context, text: LocaleKeys.doneEdited.tr(), state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);

        return LoadingFrame(
          loadingStates: [
            state is EditProfileDataLoadingState ? const LoadingPage() : const SizedBox()
          ],
          child: DefaultScaffold(
              appbarTitle: LocaleKeys.editProfile.tr(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _ProfileImage(),
                      SizedBox(
                        height: 30.h,
                      ),
                      DefaultFormField(
                          borderRadius: 16,
                          controller: cubit.nameController,
                          hint: "",
                          prefix: SvgPicture.asset(
                            SVGManager.user,
                            colorFilter:
                                const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                          ),
                          validator: defaultValidation),
                      SizedBox(
                        height: 20.h,
                      ),
                      DefaultFormField(
                          borderRadius: 16,
                          controller: cubit.phoneController,
                          hint: "",
                          prefix: const IconCall(color: Color(0xffD62464)),
                          validator: defaultPhoneNumberValidation),
                      SizedBox(
                        height: 5.h,
                      ),
                      SubTitleWidget(
                        subTitle: LocaleKeys.whatsappHint.tr(),
                        color: AppColors.darkBlue,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DefaultFormField(
                          borderRadius: 16,
                          controller: cubit.stcController,
                          hint: "",
                          prefix: const IconSTC(),
                          validator: defaultStcValidation),
                      SizedBox(
                        height: 20.h,
                      ),
                      const _EditPassword(),
                      SizedBox(
                        height: 30.h,
                      ),
                      DefaultButton(
                          buttonName: LocaleKeys.done.tr(),
                          buttonFunction: () {
                            cubit.editProfileData();
                          })
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (a, b) =>
          b is EditProfileDataSuccessState ||
          b is GetProfileDataSuccessState ||
          b is EditProfileDataErrorState ||
          b is UploadProfileImageSuccess,
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
        return Center(
          child: Column(
            children: [
              UserImage(
                image: cubit.profileImage != null
                    ? cubit.profileImage?.path
                    : cubit.profileDataModel?.image,
                radius: 60,
                isFile: cubit.profileImage != null,
                isEditing: false,
              )
              /*  UserImageWidget(
                radius: 60,
                imageUrl: cubit.profileDataModel?.image,
              ), */
              ,
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => cubit.uploadImage(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      color: Colors.blue,
                      size: 15.sp,
                    ),
                    DefaultText(
                      text: LocaleKeys.upload.tr(),
                      textStyle:
                          Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.blue),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _EditPassword extends StatelessWidget {
  const _EditPassword();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalSheet(context, const ChangePasswordBottomSheet());
      },
      child: DefaultFormField(
          borderRadius: 16,
          controller: ProfileCubit.get(context).passwordhintController,
          prefix: const Icon(
            Icons.lock,
            size: 20,
            color: Colors.black,
          ),
          hint: "****************",
          enabled: false,
          hintColor: Colors.black,
          validator: defaultValidation),
    );
  }
}
