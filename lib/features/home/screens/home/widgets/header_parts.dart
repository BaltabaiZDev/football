
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utlls/constants.dart';

AppBar headerParts() {
  return AppBar(
    backgroundColor: Colors.white,
    actions: [
      SizedBox(width: 20),
      Padding(
        padding: EdgeInsets.all(10),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(8),
            child: Icon(Iconsax.category),
          ),
        ),
      ),
      Spacer(),
      Row(
        children: [
          Text('S', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: -2)),
          Icon(Icons.sports_soccer, color: kprimaryColor, size: 25),
          Text('ccer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: -2)),
          Text(
            'Kairat',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: kprimaryColor, letterSpacing: -2),
          ),
        ],
      ),
      Spacer(),
      Padding(
        padding: EdgeInsets.all(10),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(8),
            child: Stack(
              children: [
                Icon(Iconsax.notification),

                Positioned(right: 4, child: CircleAvatar(backgroundColor: Colors.red, radius: 4)),
              ],
            ),
          ),
        ),
      ),
      SizedBox(width: 20),
    ],
  );
}