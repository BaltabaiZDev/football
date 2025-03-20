import 'package:get/get.dart';
import '../../data/repositories/match_repository.dart';
import '../../features/live_socer/controllers/match_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchRepository>(() => MatchRepository());
    Get.lazyPut<MatchController>(() => MatchController(Get.find<MatchRepository>()));
  }
}
