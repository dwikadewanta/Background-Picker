import 'package:background_picker/models/image_models.dart';
import 'package:background_picker/providers/favorites_provider.dart';
import 'package:background_picker/widgets/vertical_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'explore_screen.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({super.key, required this.data});

  final List<Background> data;

  @override
  ConsumerState<BottomNavigation> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = ExploreScreen(data: widget.data);
    var activePageTitle = 'Background Picker';

    if (_selectedPageIndex == 1) {
      final favoriteBackground = ref.watch(favoriteBackgroundProvider);
      final orientation = MediaQuery.of(context).orientation;

      if (favoriteBackground.isEmpty) {
        activePage = VerticalBackground(
          data: favoriteBackground,
          isLandscape: false,
          isFromFavorite: true,
        );
      } else {
        activePage = SingleChildScrollView(
          child: orientation == Orientation.portrait
              ? VerticalBackground(
                  data: favoriteBackground,
                  isLandscape: false,
                  isFromFavorite: true,
                )
              : VerticalBackground(
                  data: favoriteBackground,
                  isLandscape: true,
                  isFromFavorite: true,
                ),
        );
      }

      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
            activeIcon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
            activeIcon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
