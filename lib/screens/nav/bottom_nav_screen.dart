import 'package:bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/screens/favorite_screen/favorite_screen.dart';
import 'package:app/screens/home_screen/bloc/homerecipes_bloc.dart';
import 'package:app/screens/home_screen/home_screen.dart';
import 'package:app/screens/more/more.dart';
import 'package:app/screens/search_page/cubit/search_page_cubit.dart';
import 'package:app/screens/search_page/search_page.dart';

class BottomNavView extends StatefulWidget {
  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  late PersistentTabController _controller;

  final List<Widget> _widgetOptions = <Widget>[
    BlocProvider(
      create: (context) => HomeRecipesBloc(),
      child: const HomeRecipeScreen(),
    ),
    BlocProvider(
      create: (context) => SearchPageCubit(),
      child: const SearchPage(),
    ),
    const FavoriteScreen(),
    const More(),
  ];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.black,
        iconSize: 20,
        icon: const Icon(
          CupertinoIcons.house_fill,
        ),
        activeColorPrimary: Color(0xFFFF3F00),
        title: ("Home"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.black,
        iconSize: 20,
        icon: const Icon(
          CupertinoIcons.search,
        ),
        activeColorPrimary: Color(0xFFFF3F00),
        title: ("Search"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.black,
        icon: const Icon(
          CupertinoIcons.suit_heart,
        ),
        iconSize: 20,
        activeColorPrimary: Color(0xFFFF3F00),
        title: ("Favorite"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.black,
        icon: Icon(
          CupertinoIcons.list_bullet_indent,
        ),
        iconSize: 20,
        activeColorPrimary: Color(0xFFFF3F00),
        title: ("More"),
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersistentTabView(
        this.context,
        controller: _controller,
        screens: _widgetOptions,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}
