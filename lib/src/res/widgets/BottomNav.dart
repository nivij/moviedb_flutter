import 'package:codenoramovie/src/ui/discover/discover.dart';
import 'package:codenoramovie/src/ui/home/home.dart';
import 'package:codenoramovie/src/ui/home/homePage2Bloc.dart';
import 'package:codenoramovie/src/ui/settings/settings.dart';
import 'package:codenoramovie/src/ui/watchlist/watchlist.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum _SelectedTab {
  home,
  discover,
  watchlist,
  settings,

}

Widget _buildBody(_SelectedTab selectedTab) {
  switch (selectedTab) {
    case _SelectedTab.home:
      return
      HomePage();
    case _SelectedTab.discover:
      return Discover();
    case _SelectedTab.watchlist:
      return Watchlist();
    case _SelectedTab.settings:
      return Settings();
    default:
      return Container(); // Return a default screen if needed
  }
}

class BottomNav extends HookWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTab = useState(_SelectedTab.home);

    void _handleIndexChanged(int i) {
      selectedTab.value = _SelectedTab.values[i];
    }

    return Scaffold(
      extendBody: true,
      body: _buildBody(selectedTab.value),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(

          currentIndex: _SelectedTab.values.indexOf(selectedTab.value),
          height: 10,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          onTap: _handleIndexChanged,
          items: [
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: Icons.home,
              selectedColor: Colors.lime,
            ),
            CrystalNavigationBarItem(
              icon: CupertinoIcons.compass,
              unselectedIcon: CupertinoIcons.compass,
              selectedColor: Colors.lime,
            ),
            CrystalNavigationBarItem(
              icon: Icons.add_circle,
              unselectedIcon: Icons.add_circle,
              selectedColor: Colors.lime,
            ),
            CrystalNavigationBarItem(
              icon: Icons.settings_outlined,
              unselectedIcon: Icons.settings_outlined,
              selectedColor: Colors.lime,
            ),
          ],
        ),
      ),
    );
  }
}
