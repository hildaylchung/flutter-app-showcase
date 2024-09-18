// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_showcase_riverpod/screens/home.dart';
import 'profile.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static const pages = [HomeTab(), ProfileTab()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBottomNavigationIndex = useState(0);

    void onBottomNavigationBarItemTap(int index) {
      currentBottomNavigationIndex.value = index;
    }

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: pages[currentBottomNavigationIndex.value]),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onBottomNavigationBarItemTap,
          currentIndex: currentBottomNavigationIndex.value,
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Profile', icon: Icon(Icons.person_2_rounded))
          ]),
    );
  }
}
