import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class ItemRowOfButtons extends StatelessWidget {
  const ItemRowOfButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
              child: DefaultButton(
            buttonName: "شراء الان",
            buttonFunction: () {},
            textColor: Colors.white,
            color: AppColors.darkBlue,
          )),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
              child: DefaultButton(
                  buttonName: "راسل للبائع",
                  icon: SvgPicture.asset(SVGManager.chats),
                  buttonFunction: () {})),
          SizedBox(
            width: 15.w,
          ),
          CircleAvatar(
            backgroundColor: AppColors.red,
            radius: 25,
            child: SvgPicture.asset(
              SVGManager.call,
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
