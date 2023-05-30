import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/presentation/providers/navigation_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class BottomBarItem extends StatelessWidget {
  final int index;
  final IconData icon;

  const BottomBarItem({
    Key? key,
    required this.index,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationTabController>();
    final isActive = provider.isActive(index);
    return GestureDetector(
        onTap: () => provider.jumpToTab(index),
        child: Container(
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive ? AppColors.mainBlueColor : AppColors.whiteColor,
          ),
          child: Icon(
            icon,
            color: isActive
                ? AppColors.whiteColor
                : AppColors.bottomNavigationDeactiveColor,
            size: 4.h,
          ),
        ));
  }
}
