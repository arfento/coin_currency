import 'package:coin_currency/presentation/bloc/splash_page_bloc/splash_page_bloc.dart';
import 'package:coin_currency/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashPageBloc()..add(SplashPageLoadEvent(context)),
      child: _SplashPageBody(),
    );
  }
}

class _SplashPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashPageBloc, SplashPageState>(
      builder: (context, state) {
        if (state is SplashPageLoaded) {
          return const LoadingWidget();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
