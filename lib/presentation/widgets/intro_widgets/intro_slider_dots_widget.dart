// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IntroSliderDotsWidget extends StatelessWidget {
  final int currentPage;
  final int sliderLength;

  const IntroSliderDotsWidget({
    Key? key,
    required this.currentPage,
    required this.sliderLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.h,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: sliderLength,
        itemBuilder: (context, index) {
          final bool isActive = index == currentPage;
          return Padding(
            padding: index == 0 ? EdgeInsets.zero : EdgeInsets.only(left: 1.w),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 750),
              margin: const EdgeInsets.only(right: 7),
              height: 1.h,
              width: isActive ? 7.w : 3.w,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.mainBlueColor
                    : AppColors.mainGreyColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
