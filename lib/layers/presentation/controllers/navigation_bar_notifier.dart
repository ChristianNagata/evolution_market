import 'package:evolution_market/layers/presentation/ui/screens/profile.dart';
import 'package:flutter/material.dart';
import '../ui/screens/home.dart';
import '../ui/widgets/logout_dialog.dart';

class NavigationBarNotifier with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void _changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void changeOption(int index, BuildContext context) {
    _changeIndex(index);
    if (index == 0) _navigate(const Home(), context);
    if (index == 1) _navigate(const Profile(), context);
    if (index == 2) showLogoutDialog(context);
  }

  void _navigate(Widget page, BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }
}
