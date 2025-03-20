import 'dart:async';
import 'package:get/get.dart';
import '../../../data/repositories/match_repository.dart';
import '../models/match_model.dart';

class MatchController extends GetxController {
  final MatchRepository _matchRepository;

  MatchController(this._matchRepository);

  var matches = <MatchModel>[].obs;
  var selectedMatch = Rxn<MatchModel>();
  var isLoading = false.obs;

  Timer? _pollingTimer;

  @override
  void onInit() {
    super.onInit();
    fetchFixtures();
    _startPolling();
  }

  @override
  void onClose() {
    _pollingTimer?.cancel();
    super.onClose();
  }

  Future<void> fetchFixtures() async {
    try {
      isLoading.value = true;
      final data = await _matchRepository.getFixtures();
      matches.value = data;
      if (data.isNotEmpty) {
        selectedMatch.value = data.first;
        update(['selected_match']); // тек selected_match аймағын жаңартамыз
      }
    } catch (e) {
      print("Error fetching fixtures: $e");
    } finally {
      isLoading.value = false;
      update(['matches']);
    }
  }

  Future<void> fetchFixtureDetail(int fixtureId) async {
    try {
      isLoading.value = true;
      final fixture = await _matchRepository.getFixtureDetail(fixtureId);
      selectedMatch.value = fixture;
      update(['selected_match']);
    } catch (e) {
      print("Error fetching fixture detail: $e");
    } finally {
      isLoading.value = false;
      update(['selected_match']);
    }
  }

  void _startPolling() {
    _pollingTimer = Timer.periodic(const Duration(hours: 2), (timer) {
      fetchFixtures();
      if (selectedMatch.value != null) {
        fetchFixtureDetail(selectedMatch.value!.fixture.id);
      }
    });
  }
}
