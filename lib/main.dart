// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_showcase_riverpod/utils/date.dart';
import 'route.dart';
import 'screens/main_view.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  GetTimeAgo.setCustomLocaleMessages('en', CustomDateString());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routes = {
      AppRouteName.home: (context) => const HomePage(),
    };

    return MaterialApp(
      initialRoute: AppRouteName.home,
      routes: routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
