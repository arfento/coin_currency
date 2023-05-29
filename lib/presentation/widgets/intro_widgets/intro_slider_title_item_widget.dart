// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/config/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IntroSliderTitleItemWidget extends StatelessWidget {
  final String title;
  const IntroSliderTitleItemWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppStyles.mainHeadlineColorw70020spPoppins,
      ),
    );
  }
}
