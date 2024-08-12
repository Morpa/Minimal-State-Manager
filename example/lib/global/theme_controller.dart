import 'package:minimal_state_manager/minimal_state_manager.dart';

class ThemeController extends ProviderNotifier {
  bool _isDarkModeEnabled = false;

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void toggleTheme() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    notify();
  }
}
