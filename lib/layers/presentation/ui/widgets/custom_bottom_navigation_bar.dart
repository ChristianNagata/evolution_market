import 'package:evolution_market/layers/presentation/controllers/navigation_bar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth / 13;
    double fontSize = screenWidth / 32;

    NavigationBarNotifier navigation =
        Provider.of<NavigationBarNotifier>(context);
    return BottomNavigationBar(
      onTap: (index) => navigation.changeOption(index, context),
      currentIndex: navigation.selectedIndex,
      backgroundColor: Theme.of(context).backgroundColor,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      selectedItemColor: Theme.of(context).primaryColor,
      // font size
      selectedFontSize: fontSize,
      unselectedFontSize: fontSize,
      // icon theme
      selectedIconTheme: IconThemeData(size: iconSize),
      unselectedIconTheme: IconThemeData(size: iconSize),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.other_houses_rounded),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Meu Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Logout',
        ),
      ],
    );
  }
}
