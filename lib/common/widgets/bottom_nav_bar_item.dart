import 'package:fc_kairat/utlls/constants.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function() onTap;
  final IconData icon;

  const BottomNavBarItem({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? kprimaryColor : Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Icon(icon, color: isActive ? Colors.white : Colors.grey.shade400),
            if (isActive) Text(title, style: TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
