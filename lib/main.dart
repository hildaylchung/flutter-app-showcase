// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'route.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
