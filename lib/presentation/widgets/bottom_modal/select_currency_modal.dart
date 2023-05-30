// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/config/constants/assets.dart';
import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:coin_currency/presentation/bloc/currecncy_bloc/currency_bloc.dart';
import 'package:coin_currency/presentation/providers/select_currency_provider.dart';
import 'package:sizer/sizer.dart';

class SelectCurrencyModal extends StatelessWidget {
  final AppLocalizations localizations;
  final CurrencyBloc currencyBloc;
  final String? selectedCurrencyName;
  final bool toConversion;
  const SelectCurrencyModal({
    Key? key,
    required this.localizations,
    required this.currencyBloc,
    this.selectedCurrencyName,
    required this.toConversion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectCurrencyProvider(
          currencyBloc.currencies, selectedCurrencyName, localizations),
      child: _SelectCurrencyModalBody(
        currencyBloc: currencyBloc,
        localization: localizations,
        selectedCurrencyName: selectedCurrencyName,
        toConversion: toConversion,
      ),
    );
  }
}

class _SelectCurrencyModalBody extends StatelessWidget {
  final AppLocalizations localization;
  final CurrencyBloc currencyBloc;
  final String? selectedCurrencyName;
  final bool toConversion;
  const _SelectCurrencyModalBody({
    Key? key,
    required this.localization,
    required this.currencyBloc,
    this.selectedCurrencyName,
    required this.toConversion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 3.h, bottom: 3.h, right: 4.w),
              child: RawScrollbar(
                thumbColor: AppColors.mainBlueColor,
                thickness: 4,
                minThumbLength: 12.h,
                radius: const Radius.circular(35),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                  ),
                  child: SizedBox(
                    height: 50.h,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: Consumer<SelectCurrencyProvider>(
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.currenciesList.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var data = value.currenciesList[index];
                              return GestureDetector(
                                onTap: () => value.selectCurrencyItem(
                                    index, toConversion, currencyBloc, context),
                                child: Padding(
                                  padding: index > 0
                                      ? EdgeInsets.only(top: 2.h)
                                      : EdgeInsets.zero,
                                  child: AnimatedContainer(
                                    curve: Curves.easeInCubic,
                                    duration: const Duration(milliseconds: 320),
                                    padding: EdgeInsets.all(5.w),
                                    decoration: BoxDecoration(
                                        color: data.isSelected
                                            ? AppColors.mainBlueColor
                                            : AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Flexible(
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                  width: 10.w,
                                                  height: 10.w,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                          getMaterialUrl(
                                                              data.code),
                                                        ),
                                                      ))),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  data.name.toString(),
                                                  style: TextStyle(
                                                      color: data.isSelected
                                                          ? AppColors.whiteColor
                                                          : AppColors
                                                              .mainHeadlineBlackColor,
                                                      fontFamily: AppStyles
                                                          .poppinsRegularFontFamily,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14.sp),
                                                  key: UniqueKey(),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: data.isSelected,
                                          child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: AppColors.whiteColor,
                                            size: 7.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
