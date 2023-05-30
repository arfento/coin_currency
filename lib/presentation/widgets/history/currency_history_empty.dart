// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:coin_currency/config/constants/assets.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sizer/sizer.dart';

class CurrencyHistoryEmpty extends StatelessWidget {
  final AppLocalizations localization;
  const CurrencyHistoryEmpty({
    Key? key,
    required this.localization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FadeInLeft(
              child: Container(
            width: 70.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: Svg(AppImages.noDataIcon),
              fit: BoxFit.fitWidth,
            )),
          )),
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: Text(
              localization.currencyHistoryNoDataTitle,
              textAlign: TextAlign.center,
              style: AppStyles.mainHeadlineColorw70020spPoppins,
            ),
          ),
        ],
      ),
    );
  }
}
