import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/pick_image_widget.dart';
import 'package:hasad_app/common/pick_images_widget.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base_container.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';

class UploadImagesScreen extends StatelessWidget {
  const UploadImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "8",
        title: "الصور",
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectHarvestDateState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);
            return AddRequestBaseContainer(
                buttonFunction: () {
                  cubit.pageController
                      .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                },
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PickImagesWidget(text: "text", onUpload: (value) {}),
                    PickMediaWidget(text: "text", mediaType: MediaType.video, onUpload: (value) {})
                  ],
                ));
          },
        ));
  }
}
