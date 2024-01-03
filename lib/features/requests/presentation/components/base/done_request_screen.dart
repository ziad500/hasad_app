import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class DoneRequestScreen extends StatelessWidget {
  const DoneRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(SVGManager.doneRequest),
              SvgPicture.asset(SVGManager.infinity)
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          DefaultText(
            text: "شكرًا ،",
            textStyle: Theme.of(context).textTheme.bodyLarge,
          ),
          DefaultText(
              text: " سنقوم بالمراجعة وإدراج إعلانك.",
              textStyle: Theme.of(context).textTheme.bodyLarge),
          const Spacer(),
          DefaultButton(
              buttonName: "الصفحة الرئيسية",
              buttonFunction: () {
                Navigator.pushReplacementNamed(context, Routes.homeScreenRoutes);
              })
        ],
      ),
    );
  }
}
