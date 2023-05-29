// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/presentation/widgets/intro_widgets/intro_slider_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/presentation/bloc/intro_page_bloc/intro_page_bloc.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    final _localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) =>
          IntroPageBloc()..add(IntroPageLoadEvent(_localization)),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: _IntroPageBody(localization: _localization),
      ),
    );
  }
}

class _IntroPageBody extends StatelessWidget {
  final AppLocalizations localization;

  const _IntroPageBody({
    Key? key,
    required this.localization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroPageBloc, IntroPageState>(
      builder: (context, state) {
        final _bloc = context.read<IntroPageBloc>();
        return PageView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          controller: _bloc.pageController,
          onPageChanged: _bloc.onPageChanged,
          itemCount: _bloc.sliders.length,
          itemBuilder: (context, index) {
            return IntroSliderItemWidget(
              index: index,
              slider: _bloc.sliders,
              bloc: _bloc,
              localizations: localization,
            );
          },
        );
      },
    );
  }
}
