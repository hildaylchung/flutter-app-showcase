import 'package:flutter/material.dart';
import 'package:flutter_showcase_riverpod/config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [
      Text('Hi', style: AppTextStyle.pageTitle)
    ],));
  }

}