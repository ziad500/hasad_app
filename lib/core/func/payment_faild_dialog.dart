import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

Future paymentFaildDialog(context, {String? text}) => showDialog(
    context: context,
    builder: (context) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(37).w),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Icon(
                          Icons.close,
                          color: AppColors.darkBlue,
                          size: 50.sp,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        DefaultText(
                          text: "لم يكتمل الدفع",
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: AppColors.darkBlue, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        DefaultText(
                          text: text ?? "لا يوجد رصيد كافي",
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.primaryColor),
                        ),
                        const Spacer(),
                        DefaultButton(
                          buttonName: "شحن المحفظه",
                          buttonFunction: () {},
                          color: AppColors.red,
                          textColor: Colors.white,
                          icon: SvgPicture.asset(SVGManager.wallet),
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.cancel_presentation_outlined,
                      color: AppColors.primaryColor,
                      size: 25.sp,
                    )),
              )
            ],
          ),
        ));
