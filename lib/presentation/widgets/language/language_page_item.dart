// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:coin_currency/presentation/providers/navigation_tab_controller.dart';
import 'package:coin_currency/utils/helpers/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:coin_currency/data/models/language_model/language_selection_model.dart';
import 'package:coin_currency/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LanguagePageItem extends StatelessWidget {
  final LanguageBloc languageBloc;
  final AppLocalizations localization;
  final LanguageSelectionModel langObject;
  final int index;
  const LanguagePageItem({
    Key? key,
    required this.languageBloc,
    required this.localization,
    required this.langObject,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectLanguageItem(index, context),

      // onTap: () {
      //   languageBloc
      //     ..selectLanguageItem(index, localization, languageBloc)
      //     ..add(LanguageLoadEvent(localization));
      //   showLanguageChangeConfirmationDialog(
      //           context: context, localization: localization)
      //       .then((value) {
      //     final provider =
      //         Provider.of<NavigationTabController>(context, listen: false);
      //     provider.jumpToTab(0);
      //   });
      // },
      child: Padding(
        padding: index > 0 ? EdgeInsets.only(top: 2.h) : EdgeInsets.zero,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 320),
          curve: Curves.easeInCubic,
          padding: EdgeInsets.all(7.w),
          decoration: BoxDecoration(
            border: langObject.isSelected
                ? Border.all(color: AppColors.whiteColor)
                : Border.all(
                    color: AppColors.mainBackColor,
                    width: 1,
                  ),
            color: langObject.isSelected
                ? AppColors.mainBlueColor
                : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: Svg(langObject.imgUrl)),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                langObject.name,
                style: TextStyle(
                  color: langObject.isSelected
                      ? AppColors.whiteColor
                      : AppColors.mainHeadlineBlackColor,
                  fontFamily: AppStyles.poppinsRegularFontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
                key: UniqueKey(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectLanguageItem(int index, BuildContext context) {
    _makeLanguageSelected(index);
    _showSuccessLanguageChangedDialog(context);
  }

  void _showSuccessLanguageChangedDialog(context) {
    showLanguageChangeConfirmationDialog(
      context: context,
      localization: localization,
    ).then((value) {
      final _provider =
          Provider.of<NavigationTabController>(context, listen: false);
      _provider.jumpToTab(0);
    });
  }

  void _makeLanguageSelected(index) {
    languageBloc
      ..selectLanguageItem(
        index,
        localization,
        languageBloc,
      )
      ..add(LanguageLoadEvent(localization));
  }
}
