import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/cubit/bidding_list_dart_cubit.dart';

import 'package:hasad_app/utils/app_colors.dart';

class BiddingTabBarWidget extends StatefulWidget {
  const BiddingTabBarWidget(
      {super.key, required this.list, required this.onTap});
  final List<TabBarModel> list;
  final void Function(String, int) onTap;

  @override
  State<BiddingTabBarWidget> createState() => _BiddingTabBarWidgetState();
}

class _BiddingTabBarWidgetState extends State<BiddingTabBarWidget> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: widget.list
            .map((e) => Expanded(
                  child: InkWell(
                    onTap: () {
                      if (index != widget.list.indexOf(e)) {
                        setState(() {
                          index = widget.list.indexOf(e);
                        });
                        widget.onTap(_ontapFunc(widget.list.indexOf(e)), index);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8).w,
                      height: 50.h,
                      margin: EdgeInsets.only(
                          left: widget.list.indexOf(e) == 0
                              ? 5.w
                              : Constants.isArabic
                                  ? 0
                                  : 5.w,
                          right:
                              widget.list.indexOf(e) == widget.list.length - 1
                                  ? 5.w
                                  : 0),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: index == widget.list.indexOf(e)
                              ? AppColors.primaryColor
                              : AppColors.addRequestContainerColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: widget.list.indexOf(e) ==
                                      widget.list.length - 1
                                  ? Radius.circular(Constants.isArabic ? 27 : 0)
                                  : widget.list.indexOf(e) == 0
                                      ? Radius.circular(
                                          !Constants.isArabic ? 27 : 0)
                                      : const Radius.circular(0),
                              bottomRight: widget.list.indexOf(e) == 0
                                  ? Radius.circular(Constants.isArabic ? 27 : 0)
                                  : widget.list.indexOf(e) ==
                                          widget.list.length - 1
                                      ? Radius.circular(
                                          !Constants.isArabic ? 27 : 0)
                                      : const Radius.circular(0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(e.icon,
                              height: 18.sp,
                              colorFilter: ColorFilter.mode(
                                  index == widget.list.indexOf(e)
                                      ? Colors.white
                                      : Colors.black,
                                  BlendMode.srcIn)),
                          SizedBox(
                            height: 3.h,
                          ),
                          Center(
                            child: DefaultText(
                              text: e.title,
                              maxlines: 1,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 10.sp,
                                      color: index == widget.list.indexOf(e)
                                          ? Colors.white
                                          : Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
            .toList());
  }

  String _ontapFunc(int index) {
    if (index == 0) {
      return Constants.token != "" ? biddingAboutToEnd : "all-about-to-end";
    } else if (index == 1) {
      return biddingStillAvailable;
    } else if (index == 2) {
      return biddingupcoming;
    }
    return Constants.token != "" ? biddingAboutToEnd : "all-about-to-end";
  }
}

class TabBarModel {
  String icon;
  String title;
  TabBarModel({
    required this.icon,
    required this.title,
  });
}
