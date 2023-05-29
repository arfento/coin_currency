// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;

class IntroSliderMaterialItemWidget extends StatelessWidget {
  final String imgUrl;

  const IntroSliderMaterialItemWidget({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      constraints: BoxConstraints(maxHeight: 45.h),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: svg_provider.Svg(imgUrl),
        fit: BoxFit.fitWidth,
      )),
    );
  }
}
