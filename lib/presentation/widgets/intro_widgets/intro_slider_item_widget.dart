// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_currency/presentation/widgets/intro_widgets/intro_slider_button_item_widget.dart';
import 'package:coin_currency/presentation/widgets/intro_widgets/intro_slider_description_item_widget.dart';
import 'package:coin_currency/presentation/widgets/intro_widgets/intro_slider_dots_widget.dart';
import 'package:coin_currency/presentation/widgets/intro_widgets/intro_slider_material_item_widget.dart';
import 'package:coin_currency/presentation/widgets/intro_widgets/intro_slider_title_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:coin_currency/data/models/intro_page_slider_model/intro_page_slider_model.dart';
import 'package:coin_currency/presentation/bloc/intro_page_bloc/intro_page_bloc.dart';
import 'package:sizer/sizer.dart';

class IntroSliderItemWidget extends StatelessWidget {
  final int index;
  final AppLocalizations localizations;
  final IntroPageBloc bloc;
  final List<IntroPageSliderModel> slider;

  const IntroSliderItemWidget({
    Key? key,
    required this.index,
    required this.localizations,
    required this.bloc,
    required this.slider,
  }) : super(key: key);

  List<IntroPageSliderModel>? get model => slider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 4.h,
        ),
        IntroSliderMaterialItemWidget(
          imgUrl: model![index].slideImgUrl.toString(),
        ),
        IntroSliderTitleItemWidget(
          title: model![index].slideTitle.toString(),
        ),
        SizedBox(
          height: 2.h,
        ),
        IntroSliderDescriptionItemWidget(
          description: model![index].slideDescription.toString(),
        ),
        SizedBox(
          height: 2.h,
        ),
        const Spacer(),
        buildSlideDots(context),
      ],
    );
  }

  StreamBuilder buildSlideDots(BuildContext context) {
    return StreamBuilder<int>(
        stream: bloc.pageIndexStream,
        builder: (context, snapshot) {
          final pageIndex = snapshot.data ?? 0;
          final lastIndex = model!.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Column(
              children: <Widget>[
                AnimatedOpacity(
                  opacity: pageIndex == lastIndex ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 750),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: IntroSliderButtonItemWidget(
                        onPress: () => pageIndex == lastIndex
                            ? bloc.openHomePage(context)
                            : null,
                        title: localizations.introSliderLetsStartButtonText),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                IntroSliderDotsWidget(
                    currentPage: pageIndex, sliderLength: model!.length),
              ],
            ),
          );
        });
  }
}
