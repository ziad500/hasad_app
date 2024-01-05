import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/pick_image_widget.dart';
import 'package:hasad_app/common/pick_images_widget.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base_container.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class UploadImagesScreen extends StatelessWidget {
  const UploadImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "8",
        title: LocaleKeys.images.tr(),
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectHarvestDateState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);
            return AddRequestBaseContainer(
                buttonFunction: () {
                  if (cubit.images.length < 3) {
                    showSnackbar(
                        context: context,
                        text: LocaleKeys.uploadThreeImages.tr(),
                        state: ToastStates.ERROR);
                  } else if (cubit.videoPath == null) {
                    showSnackbar(
                        context: context,
                        text: LocaleKeys.uploadOneVideo.tr(),
                        state: ToastStates.ERROR);
                  } else {
                    cubit.pageController
                        .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                  }
                },
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PickImagesWidget(onUpload: (value) {
                      cubit.images = value;
                    }),
                    PickMediaWidget(
                        mediaType: MediaType.video,
                        onUpload: (value) {
                          cubit.videoPath = value;
                        })
                  ],
                ));
          },
        ));
  }
}
