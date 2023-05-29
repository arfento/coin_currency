// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IntroSliderButtonItemWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String title;

  const IntroSliderButtonItemWidget({
    Key? key,
    required this.onPress,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 7.h,
      decoration: AppStyles.mainBlueColorBoxDecorationStyle,
      child: Material(
        color: AppColors.transparentColor,
        child: InkWell(
            onTap: onPress,
            child: Center(
              child: Text(
                title,
                style: AppStyles.whiteColor15spw700NotoSans,
              ),
            )),
      ),
    );
  }
}
