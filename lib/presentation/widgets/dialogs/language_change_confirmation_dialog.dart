import 'package:animate_do/animate_do.dart';
import 'package:coin_currency/config/constants/assets.dart';
import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sizer/sizer.dart';

class LanguageChangeConfirmationDialog extends StatelessWidget {
  const LanguageChangeConfirmationDialog({
    required this.localization,
    Key? key,
  }) : super(key: key);
  final AppLocalizations localization;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 90.w,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: <Widget>[
                FadeInUp(
                  child: Container(
                    width: 70.w,
                    height: 40.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: Svg(AppImages.confirmedIcon),
                      fit: BoxFit.fitWidth,
                    )),
                  ),
                ),
                Text(
                  localization.languageConfirmationDialogTitle,
                  textAlign: TextAlign.center,
                  style: AppStyles.mainHeadlineColorw70020spPoppins,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  localization.languageConfirmationDialogDesc,
                  textAlign: TextAlign.center,
                  style: AppStyles.mainGrayColorw70013spPoppinsLineHeight,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: double.infinity,
                  height: 7.h,
                  decoration: AppStyles
                      .mainBlueColorLanguageConfirmationDialogButtonBoxDecorationStyle,
                  child: Material(
                    color: AppColors.transparentColor,
                    child: InkWell(
                        onTap: () => _comeBack(
                              context,
                            ),
                        child: Center(
                          child: Text(
                            localization.languageConfirmationDialogButtonTitle,
                            textAlign: TextAlign.center,
                            style: AppStyles.whiteColor15spw700NotoSans,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _comeBack(
    context,
  ) =>
      Navigator.pop(context, true);
}
