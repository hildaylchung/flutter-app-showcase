// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_showcase_riverpod/config.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(
            left: 16, right: 16, top: MediaQuery.of(context).padding.top),
        children: [
          Text('My Account', style: AppTextStyle.pageTitle),
          // TODO banner
          // TODO profile pic, name, edit
          // --> to edit profile page

          // TODO list of items
          // Notifications
          // Settings
          // Contact Us
        ]);
  }
}
