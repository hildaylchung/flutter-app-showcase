// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:url_launcher/url_launcher_string.dart';

Future<bool> launchUrl(String url) async {
  try {
    if (!await canLaunchUrlString(url)) {
      return false;
    }
    return launchUrlString(url);
  } catch (err) {
    debugPrint('err: $err');
  }
  return false;
}
