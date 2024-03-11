// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_showcase_riverpod/config.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Text('My Profile', style: AppTextStyle.pageTitle),
      ]),
    );
  }
}
