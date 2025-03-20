import 'package:fc_kairat/features/live_socer/screens/match_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/match_model.dart';
import 'team_logo.dart';

class FeaturedMatchWidget extends StatelessWidget {
  final MatchModel match;

  const FeaturedMatchWidget({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.yellow[100], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Column(
                children: [
                  TeamLogo(logoUrl: match.teams.home.logo),
                  SizedBox(
                    width: 100,
                    child: Text(
                      match.teams.home.name.isEmpty ? "N/A" : match.teams.home.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text("vs", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text(
                    "${match.goals.home ?? 'null'} : ${match.goals.away ?? 'null'}",
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Text("Status: ${match.fixture.status.short.isNotEmpty ? match.fixture.status.short : 'N/A'}"),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  TeamLogo(logoUrl: match.teams.away.logo),
                  SizedBox(
                    width: 100,
                    child: Text(
                      match.teams.away.name.isEmpty ? "N/A" : match.teams.away.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Get.to(() => MatchDetailScreen()),
              child: Text("Detail", style: TextStyle(color: Colors.orange)),
            ),
          ),
        ],
      ),
    );
  }
}
