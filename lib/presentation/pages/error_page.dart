// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/config/constants/assets.dart';
import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animate_do/animate_do.dart';
import 'package:coin_currency/presentation/bloc/currecncy_bloc/currency_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sizer/sizer.dart';

class ErrorPage extends StatelessWidget {
  final CurrencyBloc currencyBloc;

  const ErrorPage({
    Key? key,
    required this.currencyBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeInUp(
              child: Center(
                child: Container(
                  width: 70.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Svg(
                          AppImages.errorIcon,
                        ),
                        fit: BoxFit.fitWidth),
                  ),
                ),
              ),
            ),
            Text(
              localization.errorPageTitle,
              style: AppStyles.mainHeadlineColorw70020spPoppins,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                localization.errorPageDesc,
                style: AppStyles.mainGrayColorw70013spPoppinsLineHeight,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              width: double.infinity,
              height: 7.h,
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              decoration: AppStyles
                  .mainBlueColorLanguageConfirmationDialogButtonBoxDecorationStyle,
              child: Material(
                color: AppColors.transparentColor,
                child: InkWell(
                  onTap: _retryTap,
                  child: Center(
                    child: Text(
                      localization.errorPageRetryButtonText,
                      textAlign: TextAlign.center,
                      style: AppStyles.whiteColor15spw700NotoSans,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _retryTap() {
    currencyBloc.add(CurrencyLoadEvent());
  }
}
