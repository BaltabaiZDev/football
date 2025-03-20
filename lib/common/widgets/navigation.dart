import 'package:fc_kairat/features/home/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/bottom_nav_bar_item.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentTab = 0;
  final List<Widget> screens = [HomeScreen(), Scaffold(), Scaffold(), Scaffold()];

  final icons = [Iconsax.home, Iconsax.calendar_1, Iconsax.chart, Iconsax.personalcard];
  final titles = ['Home', 'Calendar', 'Standing', 'Account'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[currentTab],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12.withValues(alpha: 0.015), blurRadius: 8, spreadRadius: 5)],
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => BottomNavBarItem(
              title: titles[index],
              isActive: currentTab == index,
              onTap:
                  () => setState(() {
                    currentTab = index;
                  }),
              icon: icons[index],
            ),
          ),
        ),
      ),
    );
  }
}
