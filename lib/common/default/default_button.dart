import '../../utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      this.isLoading = false,
      required this.buttonName,
      required this.buttonFunction,
      this.buttonwidth,
      this.isAlert = false,
      this.color,
      this.textColor = Colors.white,
      this.height = 52,
      this.iconLeft = false,
      this.isSubButton = false,
      this.borderColor = Colors.transparent,
      this.borderRAdius = 12,
      this.icon,
      this.widget,
      this.isSecondary = false,
      this.loadingColor})
      : super(key: key);

  final String buttonName;
  final Function buttonFunction;
  final double? buttonwidth;
  final Color? color;
  final Color textColor;
  final bool isAlert;
  final bool isSubButton;
  final double? height;
  final Color borderColor;
  final Widget? icon;
  final bool iconLeft;
  final double borderRAdius;
  final Widget? widget;
  final bool isSecondary;
  final bool isLoading;
  final Color? loadingColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: MaterialButton(
        splashColor: Colors.grey.withOpacity(0.1),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSecondary ? AppColors.borderColor : borderColor,
          ), // Customize the border color and width

          borderRadius: BorderRadius.circular(borderRAdius).w,
        ),
        height: height,
        color: color ?? (isSecondary ? AppColors.white : AppColors.primaryColor),
        onPressed: isLoading
            ? null
            : () {
                buttonFunction();
              },
        child: widget ??
            Padding(
              padding: const EdgeInsets.all(5.0).w,
              child: Center(
                child: isLoading
                    ? CircularProgressIndicator(
                        color: loadingColor ?? Colors.white,
                      )
                    : FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            if (icon != null && iconLeft) ...[
                              icon!,
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                            Text(buttonName,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: isSecondary ? AppColors.textGrey : textColor)),
                            if (icon != null && !iconLeft) ...[
                              SizedBox(
                                width: 30.w,
                              ),
                              icon!
                            ],
                          ],
                        ),
                      ),
              ),
            ),
      ),
    );
  }
}
