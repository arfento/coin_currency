// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:coin_currency/data/models/language_model/language_selection_model.dart';
import 'package:coin_currency/presentation/providers/navigation_tab_controller.dart';
import 'package:coin_currency/presentation/widgets/language/language_page_overview.dart';
import 'package:coin_currency/presentation/widgets/loading_widget.dart';
import 'package:coin_currency/utils/helpers/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:coin_currency/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => LanguageBloc()..add(LanguageLoadEvent(localization)),
      child: _LanguagePageBody(
        localization: localization,
      ),
    );
  }
}

class _LanguagePageBody extends StatelessWidget {
  final AppLocalizations localization;
  const _LanguagePageBody({
    Key? key,
    required this.localization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        final blocLanguage = context.read<LanguageBloc>();

        if (state is LanguageLoading) {
          return const LoadingWidget();
        }
        if (state is LanguageLoaded) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 5.h,
                    ),
                    languagePageTitle(
                      context: context,
                      title: localization.currencyLanguagesPageTitle,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    LanguagePageOverview(
                      languageBloc: blocLanguage,
                      localization: localization,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget languagePageTitle({
    required BuildContext context,
    required String title,
  }) {
    return Center(
      child: Text(
        title,
        style: AppStyles.mainHeadlineColorw70020spPoppins,
        textAlign: TextAlign.center,
      ),
    );
  }
}
