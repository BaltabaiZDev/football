import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/gen_bind.dart';
import 'features/live_socer/screens/match_detail_screen.dart';
import 'features/live_socer/screens/match_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FC Kairat Football',
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBindings(),
      home: const MatchListScreen(),
      getPages: [
        GetPage(
          name: '/match-list',
          page: () => const MatchListScreen(),
          binding: GlobalBindings(),
        ),
        GetPage(
          name: '/match-detail',
          page: () => const MatchDetailScreen(),
          binding: GlobalBindings(),
        ),
      ],
    );
  }
}
