import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../features/live_socer/models/match_model.dart';
import '../dummy/dummy_match.dart';

class MatchRepository {
  static const String baseUrl = "https://v3.football.api-sports.io";

  static const String apiKey = "4023cd2de741cbddf4ce13210ee57a12";

  Future<List<MatchModel>> getFixtures() async {
    final url = Uri.parse("$baseUrl/fixtures?date=2025-03-20");
    final response = await http.get(
      url,
      headers: {
        "x-rapidapi-key": apiKey,
        "x-rapidapi-host": "v3.football.api-sports.io"
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> fixtures = data["response"];
      if (fixtures.isEmpty) {
        return List.generate(5, (_) => createDummyMatch());
      }
      return fixtures.map((e) => MatchModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load fixtures: ${response.statusCode}");
    }
  }

  Future<MatchModel?> getFixtureDetail(int fixtureId) async {
    final url = Uri.parse("$baseUrl/fixtures?id=$fixtureId");

    final response = await http.get(
      url,
      headers: {"x-rapidapi-key": apiKey, "x-rapidapi-host": "v3.football.api-sports.io"},
    );
    if (kDebugMode) {
      print("Detail Response for fixture $fixtureId: ${response.body}");
    }
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> fixtures = data["response"];
      if (fixtures.isNotEmpty) {
        return MatchModel.fromJson(fixtures.first);
      }
    }
    return null;
  }
}
