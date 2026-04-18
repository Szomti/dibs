import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class NavigationShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavigationShellPage(this.navigationShell, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: navigationShell),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (selectedIndex) {
          navigationShell.goBranch(
            selectedIndex,
            initialLocation: selectedIndex == navigationShell.currentIndex,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Symbols.cards_stack_rounded),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: Icon(Symbols.bookmarks_rounded),
            label: 'Reservations',
          ),
          NavigationDestination(
            icon: Icon(Symbols.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
