import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';

class DoneRequestScreen extends StatelessWidget {
  const DoneRequestScreen(
      {super.key,
      required this.donePageState,
      required this.title,
      required this.subTitle,
      this.buttonText,
      required this.route});
  final String title;
  final String subTitle;
  final String? buttonText;
  final String route;
  final DonePageState donePageState;

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
              donePageState == DonePageState.done
                  ? const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 100,
                    )
                  : donePageState == DonePageState.waiting
                      ? SvgPicture.asset(SVGManager.infinity)
                      : SvgPicture.asset(SVGManager.bidding)
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          DefaultText(
            text: title,
            textStyle: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          DefaultText(text: subTitle, textStyle: Theme.of(context).textTheme.bodyLarge),
          const Spacer(),
          DefaultButton(
              buttonName: buttonText ?? LocaleKeys.home.tr(),
              buttonFunction: () {
                Navigator.pushReplacementNamed(context, route);
              })
        ],
      ),
    );
  }
}

enum DonePageState { done, waiting, bid }

navigateToDoneScreen(context,
        {required String title,
        required String subTitle,
        String? buttonText,
        required String route,
        required DonePageState donePageState}) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DoneRequestScreen(
                  donePageState: donePageState,
                  title: title,
                  subTitle: subTitle,
                  route: route,
                  buttonText: buttonText,
                )));
