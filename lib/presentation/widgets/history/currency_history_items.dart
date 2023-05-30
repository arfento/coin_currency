// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/config/constants/assets.dart';
import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:coin_currency/data/models/currency_model/currency_history_model.dart';
import 'package:coin_currency/utils/extensions/format_extensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CurrencyHistoryItems extends StatelessWidget {
  final CurrencyHistoryModel currency;
  const CurrencyHistoryItems({
    Key? key,
    required this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.whiteColor,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                currencyHistoryItemStackedFlags(
                  context,
                  fromCurrencyCode: currency.fromCurrencyCode,
                  toCurrencyCode: currency.toCurrencyCode,
                ),
                currencyHistoryItemDate(
                  context,
                  date: currency.currentDate,
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: '${currency.fromCurrencyCode ?? 0}',
                        style: AppStyles.mainHeadlineColor14spw700NotoSans),
                    TextSpan(
                        text: ' / ',
                        style: AppStyles.mainGrayColor14spw700NotoSans),
                    TextSpan(
                        text: '${currency.toCurrencyCode ?? 0}',
                        style: AppStyles.mainHeadlineColor14spw700NotoSans),
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '${currency.fromCurrencyCode ?? 0} ',
                        style: AppStyles.mainHeadlineColor14spw700Poppins),
                    TextSpan(
                        text:
                            '${(currency.fromCurrencyValue ?? 0).makeFormattedWithComma} ',
                        style: AppStyles.mainHeadlineColor14spw700Poppins),
                  ])),
                ),
                Icon(
                  Icons.arrow_right_alt_rounded,
                  size: 8.w,
                ),
                Flexible(
                  flex: 0,
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: '${currency.toCurrencyCode ?? 0} ',
                          style: AppStyles.mainHeadlineColor14spw700Poppins),
                      TextSpan(
                          text:
                              '${(currency.toCurrencyValue ?? 0).makeFormattedWithComma} ',
                          style: AppStyles.mainHeadlineColor14spw700Poppins),
                    ]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget currencyHistoryItemStackedFlags(
    BuildContext context, {
    String? fromCurrencyCode,
    String? toCurrencyCode,
  }) {
    return Stack(
      alignment: Alignment.centerRight,
      clipBehavior: Clip.none,
      children: [
        buildStackedFlag(fromCurrencyCode),
        Positioned(
          child: buildStackedFlag(toCurrencyCode),
        ),
      ],
    );
  }

  Container buildStackedFlag(String? fromCurrencyCodeString) {
    return Container(
      width: 9.w,
      height: 9.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(getMaterialUrl(fromCurrencyCodeString)),
            fit: BoxFit.fitWidth,
          )),
    );
  }

  Widget currencyHistoryItemDate(BuildContext context, {String? date}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.8.h),
      decoration: BoxDecoration(
        color: AppColors.mainGreenColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Text(
        date.toString(),
        textAlign: TextAlign.center,
        style: AppStyles.whiteColor10spw700NotoSans,
      )),
    );
  }
}
