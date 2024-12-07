import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/common/user_image.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/profile/domain/models/profile_model.dart';
import 'package:hasad_app/features/users_search/presentation/controller/cubit/users_search_cubit.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/routes_manager.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQrCode extends StatefulWidget {
  const MyQrCode({super.key, required this.qrData, this.profileDataModel});
  final String qrData;
  final ProfileDataModel? profileDataModel;

  @override
  State<MyQrCode> createState() => _MyQrCodeState();
}

class _MyQrCodeState extends State<MyQrCode> {
  final GlobalKey globalKey = GlobalKey();
  String newQr = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UsersSearchCubit>(),
      child: BlocConsumer<UsersSearchCubit, UsersSearchState>(
        listener: (context, state) {
          if (state is GetQrCodeSuccessState) {
            Navigator.pushNamed(context, Routes.userProfileScreen, arguments: {"userId": state.id});
          }
        },
        builder: (context, state) {
          return DefaultScaffold(
              withAppbar: false,
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff4F8A73), // Lighter shade
                          Color(0xff3E735F), // Primary color
                          Color(0xff2B5C47), // Darker shade
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              SizedBox(
                                child: Container(
                                  margin: EdgeInsets.only(top: 50.sp),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 50),
                                      TitleWidget(title: isEmpty(widget.profileDataModel?.name)),
                                      const SizedBox(height: 10),
                                      SubTitleWidget(
                                          subTitle: widget.profileDataModel?.phone != null
                                              ? !widget.profileDataModel!.phone!
                                                      .toString()
                                                      .startsWith("0")
                                                  ? "0${widget.profileDataModel?.phone.toString() ?? ""}"
                                                  : widget.profileDataModel?.phone.toString() ?? ""
                                              : ""),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: /*  SizedBox(
                                            height: 200,
                                            width: 200,
                                            child: PrettyQrView.data(
                                              data: widget.qrData,
                                              decoration: PrettyQrDecoration(
                                                image: PrettyQrDecorationImage(
                                                  image: AssetImage(ImagesManager.logo),
                                                ),
                                              ),
                                            ),
                                          )  */
                                            QrImageView(
                                          data: widget.qrData,
                                          version: QrVersions.auto,
                                          size: 200,
                                        ),
                                      ),
                                      const SizedBox(height: 50),
                                    ],
                                  ),
                                ),
                              ),
                              UserImageWidget(
                                imageUrl: widget.profileDataModel?.image,
                                radius: 40.sp,
                              ),
                            ],
                          ),
                          /* const SizedBox(height: 20),
                              DefaultButton(
                                  color: Colors.white,
                                  textColor: Colors.black,
                                  icon: const Icon(Icons.download),
                                  iconLeft: true,
                                  buttonName: /* LocaleKeys.download.tr() */ "download",
                                  buttonFunction: () {}), */
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: () async {
                          UsersSearchCubit.get(context).scanQrCode();
                        },
                        icon: const Icon(
                          Icons.qr_code_scanner_sharp,
                          size: 25,
                        ),
                        color: Colors.black,
                      )
                    ],
                  )
                ],
              ));
        },
      ),
    );
  }
}
