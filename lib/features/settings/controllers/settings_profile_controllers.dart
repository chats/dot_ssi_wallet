import 'package:get/get.dart';

class SettingsProfileController extends GetxController {
  final _name = 'Somchai Singarmdee'.obs;
  final _walletId = '0x'.obs;
  final _walletKey = 'abc123'.obs;
  final _agentUrl = 'https://agent.example.com'.obs;
  final _agentWss = 'wss://agent.example.com'.obs;
  final _agentKey = 'xyz123'.obs;

  final _agentUrlVisible = false.obs;
  final _agentWssVisible = false.obs;
  final _agenKeyVisible = false.obs;
  final _walletKeyVisible = false.obs;
  final _walletIdVisible = false.obs;

  get name => _name.value;
  set name(value) => _name.value = value;

  get walletId => _walletId.value;
  set walletId(value) => _walletId.value = value;

  get walletKey => _walletKey.value;
  set walletKey(value) => _walletKey.value = value;

  get agentUrl => _agentUrl.value;
  set agentUrl(value) => _agentUrl.value = value;

  get agentWss => _agentWss.value;
  set agentWss(value) => _agentWss.value = value;

  get agentKey => _agentKey.value;
  set agentKey(value) => _agentKey.value = value;

  get agentUrlVisible => _agentUrlVisible.value;
  set agentUrlVisible(value) => _agentUrlVisible.value = value;

  get agentWssVisible => _agentWssVisible.value;
  set agentWssVisible(value) => _agentWssVisible.value = value;

  get agentKeyVisible => _agenKeyVisible.value;
  set agentKeyVisible(value) => _agenKeyVisible.value = value;

  get walletKeyVisible => _walletKeyVisible.value;
  set walletKeyVisible(value) => _walletKeyVisible.value = value;

  get walletIdVisible => _walletIdVisible.value;
  set walletIdVisible(value) => _walletIdVisible.value = value;
}
