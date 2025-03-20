import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/dummy/dummy_match.dart';
import '../controllers/match_controller.dart';
import 'audio_player_screen.dart';
import 'video_player_screen.dart';

class MatchDetailScreen extends StatefulWidget {
  const MatchDetailScreen({super.key});

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
  final matchController = Get.find<MatchController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dynamic fixtureArg = Get.arguments;
      if (fixtureArg != null && fixtureArg is int && fixtureArg != 0) {
        matchController.fetchFixtureDetail(fixtureArg);
      }
    });
  }

  String displayValue(String? value) {
    return (value == null || value.isEmpty) ? "N/A" : value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black45),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.black45),

        child: SafeArea(
          child: Obx(() {
            final match = matchController.selectedMatch.value ?? createDummyMatch();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Match Detail",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.amber[300]),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      color: Colors.white.withOpacity(0.9),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${displayValue(match.teams.home.name)} vs ${displayValue(match.teams.away.name)}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Score: ${match.goals.home?.toString() ?? "0"} : ${match.goals.away?.toString() ?? "0"}",
                                style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    const Text("Status", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 4),
                                    Text(
                                      displayValue(match.fixture.status.short),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("Date", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 4),
                                    Text(displayValue(match.fixture.date), style: const TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Батырмалар
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.amber[700],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Get.to(() => const AudioPlayerScreen());
                      },
                      icon: const Icon(Icons.audiotrack, color: Colors.black),
                      label: const Text("Listen Audio Live", style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.amber[700],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Get.to(() => const VideoPlayerScreen());
                      },
                      icon: const Icon(Icons.play_circle_fill, color: Colors.black),
                      label: const Text("Watch Video Live", style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
