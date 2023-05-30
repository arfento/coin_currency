import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SimpleNumberButton extends StatelessWidget {
  final int number;
  final VoidCallback press;
  final bool isTapped;
  const SimpleNumberButton(
      {Key? key,
      required this.isTapped,
      required this.number,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: isTapped
            ? AppStyles.activeDigitButtonBoxDecorationStyle
            : AppStyles.disabledDigitButtonBoxDecorationStyle,
        alignment: Alignment.center,
        height: 9.h,
        width: 9.h,
        child: Text(
          number.toString(),
          style: AppStyles.mainHeadlineColor15spw500Poppins.copyWith(
              color: isTapped
                  ? AppColors.whiteColor
                  : AppColors.mainHeadlineBlackColor),
        ),
      ),
    );
  }
}
