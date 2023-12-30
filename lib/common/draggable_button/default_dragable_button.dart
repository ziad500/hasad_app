/* import 'package:daysoq/common/draggable_button/draggable_button_cubit.dart';
import 'package:daysoq/core/constants.dart';
import 'package:daysoq/utils/app_colors.dart';
import 'package:daysoq/utils/app_strings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultDragableButton extends StatelessWidget {
  const DefaultDragableButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DragableButtonController(),
      builder: (controller) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.00).w, color: AppColors.primaryColor),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 5).h,
            child: GestureDetector(
              onHorizontalDragUpdate: (event) async {
                if (Constants.isArabic) {
                  if (event.primaryDelta! < 10) {
                    controller.incTansXVal(context);
                  }
                } else {
                  if (event.primaryDelta! > 10) {
                    controller.incTansXVal(context);
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    paymentSuccessful(),
                    controller.myWidth == 0.0
                        ? Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Center(
                                  child: Text(
                                    LocaleKeys.dragToStartvisit.tr,
                                    style: const TextStyle(color: AppColors.white, fontSize: 20.00),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget paymentSuccessful() => GetBuilder<DragableButtonController>(
        builder: (controller) {
          return Transform.translate(
            offset: Offset(controller.translateX, controller.translateY),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear,
              width: 154 + controller.myWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.00).w,
                color: AppColors.secondaryColor,
              ),
              child: controller.myWidth > 0.0
                  ? const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                      size: 50.00,
                    )
                  : const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                      size: 50.00,
                    ),
            ),
          );
        },
      );
}
 */