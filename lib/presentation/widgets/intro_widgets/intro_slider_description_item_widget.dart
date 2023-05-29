// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/config/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IntroSliderDescriptionItemWidget extends StatelessWidget {
  final String description;
  const IntroSliderDescriptionItemWidget({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: AppStyles.mainHeadlineColorw50012spPoppinsLineHeight,
      ),
    );
  }
}
