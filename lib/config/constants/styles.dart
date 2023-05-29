import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

final bool deviceTablet = SizerUtil.deviceType == DeviceType.tablet;

abstract class AppStyles {
  static const poppinsRegularFontFamily = "Poppins";
  static const notoSansFontFamily = "Noto Sans";

  static final mainHeadlineColorw70020spPoppins = TextStyle(
    color: AppColors.mainHeadlineBlackColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: poppinsRegularFontFamily,
  );

  static final mainHeadlineColorw70017spPoppins = TextStyle(
    color: AppColors.mainHeadlineBlackColor,
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
    fontFamily: poppinsRegularFontFamily,
  );

  static final mainGrayColorw70013spPoppinsLineHeight = TextStyle(
    color: AppColors.greyColor,
    fontSize: 13.sp,
    height: 1.5,
    fontWeight: FontWeight.w700,
    fontFamily: poppinsRegularFontFamily,
  );

  static final mainHeadlineColorw70022spPoppins = TextStyle(
    color: AppColors.mainHeadlineBlackColor,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    fontFamily: poppinsRegularFontFamily,
  );

  static final mainHeadlineColorw70015spPoppins = TextStyle(
    color: AppColors.mainHeadlineBlackColor,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    fontFamily: poppinsRegularFontFamily,
  );
  static final mainHeadlineColorw50012spPoppinsLineHeight = TextStyle(
    color: AppColors.mainHeadlineBlackColor,
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.w500,
    fontFamily: poppinsRegularFontFamily,
  );

  static final whiteColor15spw700NotoSans = TextStyle(
      color: AppColors.whiteColor,
      fontFamily: notoSansFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 15.sp);

  static final whiteColor10spw700NotoSans = TextStyle(
      color: AppColors.whiteColor,
      fontFamily: notoSansFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 10.sp);

  static final mainHeadlineColor15spw500Poppins = TextStyle(
      color: AppColors.mainHeadlineBlackColor,
      fontFamily: poppinsRegularFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 15.sp);

  static final mainHeadlineColor14spw700NotoSans = TextStyle(
      color: AppColors.mainHeadlineBlackColor,
      fontFamily: notoSansFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);
  static final mainHeadlineColor14spw700Poppins = TextStyle(
      color: AppColors.mainHeadlineBlackColor,
      fontFamily: poppinsRegularFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);

  static final mainGrayColor14spw700NotoSans = TextStyle(
      color: AppColors.greyColor,
      fontFamily: notoSansFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);

  static final mainHeadlineColor14spw700NotoSansLineHeight = TextStyle(
      color: AppColors.mainHeadlineBlackColor,
      fontFamily: notoSansFontFamily,
      height: 1.5,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);

  static final greyColor11spw700Poppins = TextStyle(
      color: AppColors.greyColor,
      fontFamily: poppinsRegularFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 11.sp);

  static final mainBlueColorBoxDecorationStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: AppColors.mainBlueColor,
  );

  static final mainBlueColorExceedInputDialogButtonBoxDecorationStyle =
      BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: AppColors.mainBlueColor,
  );

  static final mainBlueColorLanguageConfirmationDialogButtonBoxDecorationStyle =
      BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: AppColors.mainBlueColor,
  );

  static final fromCurrencyBoxDecorationStyle = BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.blueGrayColor, width: 1));

  static final disabledDigitButtonBoxDecorationStyle = BoxDecoration(
      boxShadow: [mainDigitBoxShadowStyle],
      shape: BoxShape.circle,
      color: AppColors.whiteColor);

  static const activeDigitButtonBoxDecorationStyle =
      BoxDecoration(shape: BoxShape.circle, color: AppColors.mainBlueColor);

  static final mainDigitBoxShadowStyle = BoxShadow(
    color: AppColors.mainBlueColor.withOpacity(0.1),
    spreadRadius: 2,
    blurRadius: 7,
    offset: const Offset(0, 3),
  );
}
