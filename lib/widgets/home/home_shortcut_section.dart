// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:flutter_showcase_riverpod/config.dart';

const double iconSize = 25;

class Shortcut {
  String name;

  /// icon
  String? iconAssetPath;
  IconData? icon;

  /// onTap handle
  Function? onTap;
  String? route;

  Shortcut(
      {required this.name,
      this.icon,
      this.iconAssetPath,
      this.onTap,
      this.route})
      : assert(icon != null || iconAssetPath != null),
        assert(onTap != null || route != null);
}

final List<Shortcut> homepageShortcuts = [
  Shortcut(
      name: 'Profile',
      iconAssetPath: 'assets/svgs/profile.svg',
      onTap: () => print('profile')),
  Shortcut(
      name: 'Wallet',
      iconAssetPath: 'assets/svgs/profile.svg',
      onTap: () => print('wallet'))
];

class ShortcutSection extends StatelessWidget {
  const ShortcutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 12,
        runSpacing: 12,
        children:
            homepageShortcuts.map((s) => ShortcutButton(shortcut: s)).toList());
  }
}

class ShortcutButton extends StatelessWidget {
  final Shortcut shortcut;

  const ShortcutButton({super.key, required this.shortcut});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (shortcut.onTap != null) {
            shortcut.onTap!();
          } else {
            Navigator.of(context).pushNamed(shortcut.route!);
          }
        },
        child: Column(children: [
          if (shortcut.icon != null)
            Icon(shortcut.icon!, size: iconSize)
          else if (shortcut.iconAssetPath!.contains('.svg'))
            SvgPicture.asset(shortcut.iconAssetPath!,
                width: iconSize, height: iconSize)
          else
            Image.asset(shortcut.iconAssetPath!,
                width: iconSize, height: iconSize),
          Text(shortcut.name, style: AppTextStyle.bodyTight)
        ]));
  }
}
