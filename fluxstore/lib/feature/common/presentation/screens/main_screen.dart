import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/feature/common/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:fluxstore/feature/common/presentation/screens/cart_screen.dart';
import 'package:fluxstore/feature/common/presentation/screens/home_screen.dart';
import 'package:fluxstore/feature/common/presentation/screens/profile_screen.dart';
import 'package:fluxstore/feature/common/presentation/screens/search_screen.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_drawer.dart';
import 'package:fluxstore/feature/common/presentation/widgets/custom_navigation.dart';
import 'package:fluxstore/feature/common/presentation/widgets/main_page_appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, index) {
        return Scaffold(
          key: scaffoldKey,
          appBar: MainPageAppbar(
            onTap: () => scaffoldKey.currentState?.openDrawer(),
          ),
          body: screens[index],
          bottomNavigationBar: CustomNavigation(
            currentIndex: index,
            onTap: (i) {
              setState(() {
                selectedIndex == i;
              });

              context.read<NavigationCubit>().setTab(i);
            },
          ),
          drawer: CustomDrawer(
            isSelected: selectedIndex,
            onSelected: (index) {
              print(selectedIndex);
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}
