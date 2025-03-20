import 'package:fc_kairat/features/live_socer/screens/widgets/featured_match.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/screens/home/widgets/header_parts.dart';
import '../controllers/match_controller.dart';
import 'widgets/match_list_item.dart';

class MatchListScreen extends StatelessWidget {
  const MatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: headerParts(),
      body: GetBuilder<MatchController>(
        id: 'matches',
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.matches.isEmpty) {
            return const Center(child: Text("No matches found"));
          }
          return Column(
            children: [
              const SizedBox(height: 20),
              GetBuilder<MatchController>(
                id: 'selected_match',
                builder: (controller) {
                  if (controller.selectedMatch.value == null) {
                    return const SizedBox();
                  }
                  return FeaturedMatchWidget(match: controller.selectedMatch.value!);
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  itemCount: controller.matches.length,
                  itemBuilder: (context, index) {
                    final match = controller.matches[index];
                    return MatchListItem(match: match, count: '0');
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
