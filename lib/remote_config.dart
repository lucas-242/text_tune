import 'package:firebase_remote_config/firebase_remote_config.dart';

abstract class RemoteConfig {
  static const _apiKey = 'abacus_api_key';
  static const _endpoint = 'abacus_endpoint';

  static Future<void> initialize() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setDefaults(const {
      _apiKey: '',
      _endpoint: '',
    });

    await remoteConfig.fetchAndActivate();
  }

  static String get apiKey => FirebaseRemoteConfig.instance.getString(_apiKey);
  static String get endpoint =>
      FirebaseRemoteConfig.instance.getString(_endpoint);
}
