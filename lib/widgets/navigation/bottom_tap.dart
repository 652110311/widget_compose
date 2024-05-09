import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomTap extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

   const BottomTap({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('BottomTap'));

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
          NavigationDestination(label: 'Account', icon: Icon(Icons.person)),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
