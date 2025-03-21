import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../ViewModels/TabBarViewModel.dart';
import 'HomeView.dart';
import 'OrderTrackView.dart';
import 'ProfileView.dart';

class MainTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TabBarViewModel>(context, listen: false);

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: viewModel.selectedIndex,
        onTap: viewModel.setSelectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.location_circle),
            label: 'Order Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Account',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomeView();
              case 1:
                return OrderTrackView();
              case 2:
                return ProfileView();
              default:
                return HomeView();
            }
          },
        );
      },
    );
  }
}
