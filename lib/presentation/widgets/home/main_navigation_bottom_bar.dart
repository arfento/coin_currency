import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/presentation/widgets/home/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainNavigationBottomBar extends StatelessWidget {
  const MainNavigationBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: AspectRatio(
            aspectRatio: 374 / 90,
            child: Stack(alignment: Alignment.center, children: [
              Container(
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 8.w,
                        right: 8.w,
                        bottom: MediaQuery.of(context).viewPadding.bottom),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BottomBarItem(icon: Icons.calculate, index: 0),
                        BottomBarItem(icon: Icons.history, index: 1),
                        BottomBarItem(icon: Icons.language_rounded, index: 2),
                      ],
                    ),
                  )),
            ])));
  }
}
