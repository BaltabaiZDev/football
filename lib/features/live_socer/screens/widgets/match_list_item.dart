import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/match_controller.dart';
import '../../models/match_model.dart';
import 'team_logo.dart';

class MatchListItem extends StatelessWidget {
  final MatchModel match;
  final String count;
  const MatchListItem({super.key, required this.match, required this.count});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MatchController>();
    return InkWell(
      onTap: () {
        controller.selectedMatch.value = match;
        controller.update(['selected_match']);

      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TeamLogo(logoUrl: match.teams.home.logo),
                const SizedBox(height: 4),
                SizedBox(
                  width: 70,
                  child: Text(
                    match.teams.home.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            // Score көрсету
            Expanded(
              child: Center(
                child: Text(
                  "${match.goals.home ?? 0} : ${match.goals.away ?? 0}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Away команда логотипі және аты
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TeamLogo(logoUrl: match.teams.away.logo),
                const SizedBox(height: 4),
                SizedBox(
                  width: 70,
                  child: Text(
                    match.teams.away.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
