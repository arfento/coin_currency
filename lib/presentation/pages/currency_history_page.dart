import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:coin_currency/presentation/bloc/currecncy_bloc/currency_bloc.dart';
import 'package:coin_currency/presentation/widgets/history/currency_history_empty.dart';
import 'package:coin_currency/presentation/widgets/history/currency_history_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';

class CurrencyHistoryPage extends StatelessWidget {
  const CurrencyHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final currencyBloc = BlocProvider.of<CurrencyBloc>(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: currencyBloc.currenciesHistory.isEmpty
          ? CurrencyHistoryEmpty(localization: localization)
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 5.h),
                    currencyHistoryTitle(
                        title: localization.currencyHistoryPageTitle),
                    SizedBox(height: 3.h),
                    currencyItems(
                      context: context,
                      currencyBloc: currencyBloc,
                      localization: localization,
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
    );
  }

  Widget currencyHistoryTitle({required String title}) {
    return Text(
      title,
      style: AppStyles.mainHeadlineColorw70020spPoppins,
      textAlign: TextAlign.center,
    );
  }

  Widget currencyItems(
      {required BuildContext context,
      required CurrencyBloc currencyBloc,
      required AppLocalizations localization}) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: currencyBloc.currenciesHistory.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
            child: CurrencyHistoryItems(
              currency: currencyBloc.currenciesHistory[index],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
            color: AppColors.mainDividerBackColor,
          );
        },
      ),
    );
  }
}
