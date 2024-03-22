import 'package:dot_ssi_wallet/constants/constants.dart';

import '../core/my_shared_preferences.dart';

class ProfileService {
  static String walletIdKey = "walletId";
  static String walletKeyKey = "walletKey";
  static String agentUrlKey = "agentUrl";
  static String agentWssKey = "agentWss";
  static String agentKeyKey = "agentKey";

  static Future<String> getWalletId() async {
    final pref = MySharedPreferences();
    final prefWalletId = await pref.getData(walletIdKey);
    return prefWalletId ?? "";
  }

  static void saveWalletId(String walletId) async {
    final pref = MySharedPreferences();
    await pref.saveData(walletIdKey, walletId);
  }

  static Future<String> getWalletKey() async {
    final pref = MySharedPreferences();
    final prefWalletKey = await pref.getData(walletKeyKey);
    return prefWalletKey ?? "";
  }

  static void saveWalletKey(String walletKey) async {
    final pref = MySharedPreferences();
    await pref.saveData(walletKeyKey, walletKey);
  }

  static Future<String> getAgentUrl() async {
    final pref = MySharedPreferences();
    final prefAgentUrl = await pref.getData(agentUrlKey);
    return prefAgentUrl ?? agentUrl;
  }

  static void saveAgentUrl(String agentUrl) async {
    final pref = MySharedPreferences();
    await pref.saveData(agentUrlKey, agentUrl);
  }

  static Future<String> getAgentWss() async {
    final pref = MySharedPreferences();
    final prefAgentWss = await pref.getData(agentWssKey);
    return prefAgentWss ?? agentWss;
  }

  static void saveAgentWss(String agentWss) async {
    final pref = MySharedPreferences();
    await pref.saveData(agentWssKey, agentWss);
  }

  static Future<String> getAgentKey() async {
    final pref = MySharedPreferences();
    final prefAgentKey = await pref.getData(agentKeyKey);
    return prefAgentKey ?? agentKey;
  }

  static void saveAgentKey(String agentKey) async {
    final pref = MySharedPreferences();
    await pref.saveData(agentKeyKey, agentKey);
  }
}
