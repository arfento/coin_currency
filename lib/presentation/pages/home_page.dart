import 'package:coin_currency/config/constants/colors.dart';
import 'package:coin_currency/presentation/bloc/currecncy_bloc/currency_bloc.dart';
import 'package:coin_currency/presentation/pages/error_page.dart';
import 'package:coin_currency/presentation/providers/navigation_tab_controller.dart';
import 'package:coin_currency/presentation/widgets/home/main_navigation_bottom_bar.dart';
import 'package:coin_currency/presentation/widgets/loading_widget.dart';
import 'package:coin_currency/utils/home_nav_pages_data_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavigationTabController>(
      create: (context) => NavigationTabController(),
      child: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  static final pages = HomeNavPagesDataUtility.getNavPages();

  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      extendBody: false,
      extendBodyBehindAppBar: true, // Needed to show content under appbar
      bottomNavigationBar: const MainNavigationBottomBar(),
      body: Consumer<NavigationTabController>(
        builder: (__, nav, _) => BlocProvider(
            create: (_) => CurrencyBloc()..add(CurrencyLoadEvent()),
            child: BlocBuilder<CurrencyBloc, CurrencyState>(
                builder: (context, state) {
              print("home state : $state");
              final currencyBloc = context.read<CurrencyBloc>();
              if (state is CurrencyLoading) {
                return const LoadingWidget();
              }
              if (state is CurrencyLoaded) {
                return _HomePageBody.pages[nav.index];
              }
              if (state is CurrencyError) {
                return ErrorPage(currencyBloc: currencyBloc);
              }
              return const LoadingWidget();
            })),
      ),
    );
  }
}
