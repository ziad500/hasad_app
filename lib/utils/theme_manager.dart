import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      useMaterial3: false,
      iconTheme: const IconThemeData(
        color: AppColors.iconColor,
      ),
      radioTheme: const RadioThemeData(
        visualDensity: VisualDensity.compact,
        fillColor: MaterialStatePropertyAll(AppColors.iconColor),
      ),
      listTileTheme: const ListTileThemeData(
        textColor: AppColors.textGrey,
        horizontalTitleGap: 0,
      ),
      tabBarTheme: TabBarTheme(
          labelPadding: EdgeInsets.zero,
          unselectedLabelColor: AppColors.secondaryColor,
          labelStyle: getBoldStyle(
            color: AppColors.secondaryColor,
            fontSize: FontSize.s14.sp,
          ),
          unselectedLabelStyle: getMediumStyle(color: Colors.grey, fontSize: FontSize.s14.sp),
          labelColor: AppColors.primaryColor,
          indicatorColor: AppColors.primaryColor),
      scaffoldBackgroundColor: AppColors.white,
      //main colors
      primaryColor: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryColor.withOpacity(0.5),
      primaryColorDark: AppColors.primaryColor,
      disabledColor: Colors.grey,
      splashColor: AppColors.primaryColor.withOpacity(0.5), // ripple effect color
      //cardView theme
      cardTheme:
          const CardTheme(color: AppColors.white, shadowColor: Colors.grey, elevation: AppSize.s4),
      //appbar theme
      appBarTheme: AppBarTheme(
          titleSpacing: 0,
          color: AppColors.white,
          iconTheme: const IconThemeData(color: AppColors.black, size: 20),
          elevation: AppSize.s0,
          shadowColor: AppColors.primaryColor.withOpacity(0.5),
          titleTextStyle: getRegularStyle(color: AppColors.black, fontSize: 16)),
      //button theme
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(), splashColor: Colors.grey, hoverColor: Colors.grey),
      //elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                color: AppColors.white,
                fontSize: 17,
              ),
/*               backgroundColor: AppColors.primary,
 */
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12)))),
      //text theme
      textTheme: TextTheme(
          headlineLarge: getBoldStyle(color: AppColors.black, fontSize: FontSize.s20.sp),
          headlineMedium: getBoldStyle(
            color: AppColors.black,
            fontSize: FontSize.s16.sp,
          ),
          headlineSmall: getBoldStyle(color: AppColors.black, fontSize: FontSize.s14.sp),
          titleMedium: getSemiBoldStyle(color: AppColors.black, fontSize: FontSize.s16.sp),
          titleLarge: getSemiBoldStyle(color: AppColors.black, fontSize: FontSize.s20.sp),
          titleSmall: getSemiBoldStyle(color: AppColors.black, fontSize: FontSize.s14.sp),
          bodyLarge: getRegularStyle(color: AppColors.black, fontSize: FontSize.s20.sp),
          bodySmall: getRegularStyle(color: AppColors.black, fontSize: FontSize.s16.sp),
          bodyMedium: getRegularStyle(color: AppColors.black, fontSize: FontSize.s14.sp),
          labelSmall: getRegularStyle(color: AppColors.textGrey, fontSize: FontSize.s10.sp),
          labelMedium: getRegularStyle(color: AppColors.textGrey, fontSize: FontSize.s12.sp),
          labelLarge: getRegularStyle(color: AppColors.textGrey, fontSize: FontSize.s14.sp),
          /*     displayLarge: ,
        displayMedium: , */
          displaySmall: getRegularStyle(color: AppColors.textGrey, fontSize: FontSize.s10)),

      //input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
          //content padding
          contentPadding: const EdgeInsets.all(AppPadding.p8),
          //hint style
          hintStyle: getRegularStyle(color: Colors.grey, fontSize: FontSize.s14),
          //label style
          labelStyle: getMediumStyle(color: Colors.grey, fontSize: FontSize.s14),
          //error style
          errorStyle: getRegularStyle(color: AppColors.red, fontSize: FontSize.s14),
          //enable border style
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          //focused border style
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
          ),

          //error border style
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
          //focused error border style
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor, width: AppSize.s1_5),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))));
}
