import 'package:fc_kairat/features/home/screens/home/widgets/header_parts.dart';
import 'package:fc_kairat/features/home/screens/home/widgets/live_match_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: headerParts(),
      body: Column(
        children: [
          LiveMatchText(),

        ],
      ),
    );
  }
}


