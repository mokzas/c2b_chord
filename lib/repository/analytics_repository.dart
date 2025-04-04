import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
}

class AnalyticsRepository {
  static Future<void> setUser(String id) async {
    await AnalyticsService.analytics.setUserId(id: id);
  }

  static Future<void> logAppOpen() async {
    await AnalyticsService.analytics.logAppOpen();
  }

  static Future<void> logEvent(String name, Map<String, Object>? event) async {
    await AnalyticsService.analytics.logEvent(
      name: name,
      parameters: event,
    );
  }
}
