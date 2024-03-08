// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'news_feed.dart';
import 'profile.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static const pages = [NewsFeed(), ProfilePage()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBottomNavigationIndex = useState(0);

    void onBottomNavigationBarItemTap(int index) {
      currentBottomNavigationIndex.value = index;
    }

    return Scaffold(
      body: pages[currentBottomNavigationIndex.value],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onBottomNavigationBarItemTap,
          currentIndex: currentBottomNavigationIndex.value,
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
                label: 'News', icon: Icon(Icons.new_releases)),
            BottomNavigationBarItem(
                label: 'Profile', icon: Icon(Icons.person_2_rounded))
          ]),
    );
  }
}
