import 'package:coin_currency/config/constants/assets.dart';
import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:coin_currency/data/models/currency_model/currency_view_model.dart';
import 'package:coin_currency/presentation/bloc/currecncy_bloc/currency_bloc.dart';
import 'package:coin_currency/presentation/widgets/home/calculator/dropdown_flag_icon.dart';
import 'package:coin_currency/presentation/widgets/home/calculator/dropdown_icon.dart';
import 'package:coin_currency/presentation/widgets/home/calculator/dropdown_text.dart';
import 'package:coin_currency/presentation/widgets/home/num_keyboard_widget.dart';
import 'package:coin_currency/utils/extensions/format_extensions.dart';
import 'package:coin_currency/utils/helpers/bottom_modal_sheet_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final currencyBloc = BlocProvider.of<CurrencyBloc>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 5.h),
          calculatorTile(
              title: localization.calculatorPageTitle, context: context),
          SizedBox(height: 3.h),
          calculatorConverterField(
              currencyBloc: currencyBloc,
              localization: localization,
              context: context),
          SizedBox(height: 3.h),
          calculatorCurrencyViewBox(
              currencyBloc: currencyBloc, context: context),
          const Spacer(),
          NumKeyboardWidget(
              currencyBloc: currencyBloc, localization: localization),
        ],
      ),
    );
  }

  Widget calculatorTile(
      {required String title, required BuildContext context}) {
    return Text(
      title,
      style: AppStyles.mainHeadlineColorw70020spPoppins,
      textAlign: TextAlign.center,
    );
  }

  Widget calculatorConverterField(
      {required CurrencyBloc currencyBloc,
      required AppLocalizations localization,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          calculatorFromCurrencyBox(
              currencyBloc: currencyBloc,
              localization: localization,
              context: context),
          InkWell(
            onTap: currencyBloc.exchangeCurrencyConversions,
            child: Container(
              width: 6.w,
              height: 6.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(AppImages.swapIcon),
              )),
            ),
          ),
          calculatorToCurrencyBox(
            currencyBloc: currencyBloc,
            localization: localization,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget calculatorFromCurrencyBox(
      {required CurrencyBloc currencyBloc,
      required AppLocalizations localization,
      required BuildContext context}) {
    return StreamBuilder<CurrencyViewModel>(
      stream: currencyBloc.fromConversionStream,
      initialData: currencyBloc.currencies.elementAt(0),
      builder: (context, snapshot) {
        final currency = snapshot.data;
        return InkWell(
          onTap: () => showFromCurrencyBottomModal(
            context,
            localization,
            currencyBloc,
            currency?.code.toString(),
            toConversionBoolean: false,
          ),
          child: Container(
            decoration: AppStyles.fromCurrencyBoxDecorationStyle,
            padding: EdgeInsets.all(2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownFlagIcon(currency?.code),
                SizedBox(
                  width: 3.w,
                ),
                DropdownText(text: currency?.code),
                SizedBox(
                  width: 3.w,
                ),
                const DropdownIcon(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget calculatorToCurrencyBox({
    required CurrencyBloc currencyBloc,
    required AppLocalizations localization,
    required BuildContext context,
  }) {
    return StreamBuilder<CurrencyViewModel>(
        stream: currencyBloc.toConversionStream,
        initialData: currencyBloc.currencies.elementAt(1),
        builder: (context, snapshot) {
          final currency = snapshot.data;
          return InkWell(
            onTap: () => showFromCurrencyBottomModal(
              context,
              localization,
              currencyBloc,
              currency?.code.toString(),
              toConversionBoolean: true,
            ),
            child: Container(
              decoration: AppStyles.fromCurrencyBoxDecorationStyle,
              padding: EdgeInsets.all(2.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DropdownFlagIcon(currency?.code),
                    SizedBox(
                      width: 3.w,
                    ),
                    DropdownText(text: currency?.code),
                    SizedBox(
                      width: 3.w,
                    ),
                    const DropdownIcon(),
                  ]),
            ),
          );
        });
  }

  Widget calculatorCurrencyViewBox(
      {required CurrencyBloc currencyBloc, required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 88.w,
          decoration: BoxDecoration(
            color: AppColors.mainBackColor,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
          child: Column(
            children: <Widget>[
              StreamBuilder<double>(
                initialData: 0,
                stream: currencyBloc.typedConversionStream,
                builder: (context, snapshot) {
                  return StreamBuilder<double>(
                    initialData: 0.0,
                    stream: currencyBloc.conversionStream,
                    builder: (context, conversionSnapshot) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text:
                                    '${(snapshot.data ?? 0).makeFormattedWithSpace} ',
                                style: AppStyles
                                    .mainHeadlineColor14spw700NotoSansLineHeight),
                            TextSpan(
                                text:
                                    '${currencyBloc.fromConversionValue.code} = ',
                                style: AppStyles
                                    .mainHeadlineColor14spw700NotoSansLineHeight),
                            TextSpan(
                              text:
                                  '${(conversionSnapshot.data ?? 0).makeFormattedWithSpace} ',
                              style: AppStyles
                                  .mainHeadlineColor14spw700NotoSansLineHeight,
                            ),
                            TextSpan(
                              text: '${currencyBloc.toConversionValue.code}',
                              style: AppStyles
                                  .mainHeadlineColor14spw700NotoSansLineHeight,
                            ),
                          ]),
                          key: UniqueKey(),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Center(
                child: Text(
                  currencyBloc.formattedDate,
                  textAlign: TextAlign.center,
                  style: AppStyles.greyColor11spw700Poppins,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
