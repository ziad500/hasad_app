import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class BiddingRowOfButtons extends StatelessWidget {
  const BiddingRowOfButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
              child: DefaultButton(
                  buttonName: "المزايدة الان",
                  textColor: Colors.white,
                  color: AppColors.darkRed,
                  buttonFunction: () {})),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: DefaultButton(
            buttonName: "شراء الان",
            buttonFunction: () {},
            textColor: Colors.white,
            color: AppColors.darkBlue,
          )),
          SizedBox(
            width: 10.w,
          ),
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 25,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      SVGManager.chats,
                      height: 20.sp,
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    DefaultText(
                      text: "راسل البائع",
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 10.sp, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
