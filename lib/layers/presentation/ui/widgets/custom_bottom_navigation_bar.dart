import 'package:evolution_market/layers/presentation/controllers/navigation_bar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationBarNotifier navigation =
        Provider.of<NavigationBarNotifier>(context);
    return BottomNavigationBar(
      onTap: (index) => navigation.changeOption(index, context),
      currentIndex: navigation.selectedIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
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
