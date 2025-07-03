import 'package:flutter/material.dart';
import 'package:grabber/screens/favourite_screen.dart';
import 'package:grabber/screens/home_screen.dart';
import 'package:grabber/screens/menu_screen.dart';
import 'package:grabber/screens/profile_screen.dart';
import 'package:grabber/screens/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  List<Widget> screens = [
    HomeScreen(),
    FavouriteScreen(),
    SearchScreen(),
    ProfileScreen(),
    MenuScreen(),
  ];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_filled),
        iconSize: 32,
        title: ("Home"),
        activeColorPrimary: Color(0xff0CA201),
        inactiveColorPrimary: Colors.black,
        scrollController: scrollController,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          routes: {
            "lib/screens/home_screen.dart": (final context) =>
                const HomeScreen(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite_border_rounded),
        iconSize: 29,
        title: ("Favourite"),
        activeColorPrimary: Color(0xff0CA201),
        inactiveColorPrimary: Colors.black,
        scrollController: scrollController,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          routes: {
            "lib/screens/favourite_screen.dart": (final context) =>
                const FavouriteScreen(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search_rounded),
        iconSize: 32,
        title: ("Search"),
        activeColorPrimary: Color(0xff0CA201),
        inactiveColorPrimary: Colors.black,
        scrollController: scrollController,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          routes: {
            "lib/screens/search_screen.dart": (final context) =>
                const SearchScreen(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        iconSize: 32,
        title: ("Profile"),
        activeColorPrimary: Color(0xff0CA201),
        inactiveColorPrimary: Colors.black,
        scrollController: scrollController,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          routes: {
            "lib/screens/profile_screen.dart": (final context) =>
                const ProfileScreen(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.menu_rounded),
        iconSize: 32,
        title: ("Menu"),
        activeColorPrimary: Color(0xff0CA201),
        inactiveColorPrimary: Colors.black,
        scrollController: scrollController,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          routes: {
            "lib/screens/menu_screen.dart": (final context) =>
                const MenuScreen(),
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens,
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 6, bottom: 2),
      backgroundColor: Color(0xffFEF7FF),
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style3,
    );
  }
}
