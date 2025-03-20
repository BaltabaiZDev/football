import 'package:flutter/material.dart';

import 'app.dart';
import 'common/service/push_notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initialize();
  runApp(const MyApp());
}
