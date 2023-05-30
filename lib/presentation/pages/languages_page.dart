// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/config/constants/styles.dart';
import 'package:coin_currency/data/models/language_model/language_selection_model.dart';
import 'package:coin_currency/presentation/providers/navigation_tab_controller.dart';
import 'package:coin_currency/presentation/widgets/loading_widget.dart';
import 'package:coin_currency/utils/helpers/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:coin_currency/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({Key? key}) : super(key: key);

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  late AppLocalizations localization;

  @override
  void initState() {
    super.initState();
    localization = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    localization = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => LanguageBloc()..add(LanguageLoadEvent(localization)),
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
              physics: BouncingScrollPhysics(),
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
                    languagePageOverview(
                      bloc: blocLanguage,
                      localization: localization,
                      context: context,
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

  Widget languagePageOverview(
      {required LanguageBloc bloc,
      required AppLocalizations localization,
      required BuildContext context}) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return languagePageItem(
            context: context,
            languageBloc: bloc,
            data: bloc.languages[index],
            index: index,
          );
        },
      ),
    );
  }

  Widget languagePageItem({
    required BuildContext context,
    required LanguageBloc languageBloc,
    required LanguageSelectionModel data,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        languageBloc
          ..selectLanguageItem(index, localization, languageBloc)
          ..add(LanguageLoadEvent(localization));
        showLanguageChangeConfirmationDialog(
                context: context, localization: localization)
            .then((value) {
          final provider =
              Provider.of<NavigationTabController>(context, listen: false);
          provider.jumpToTab(0);
        });
      },
      child: Padding(
        padding: index > 0 ? EdgeInsets.only(top: 2.h) : EdgeInsets.zero,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 320),
          curve: Curves.easeInCubic,
          padding: EdgeInsets.all(7.w),
          decoration: BoxDecoration(
            border: data.isSelected
                ? Border.all(color: AppColors.whiteColor)
                : Border.all(
                    color: AppColors.mainBackColor,
                    width: 1,
                  ),
            color: data.isSelected
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
                  image: DecorationImage(image: Svg(data.imgUrl)),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                data.name,
                style: TextStyle(
                  color: data.isSelected
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
}
