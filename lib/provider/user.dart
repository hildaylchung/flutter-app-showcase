// Package imports:
import 'package:riverpod/riverpod.dart';

class UserState {
  User? user;
  UserState({this.user});
}

class User {
  final String userId;
  final String name;

  User({required this.userId, required this.name});
}

class GlobalUserNotifier extends Notifier<UserState> {
  @override
  UserState build() {
    return UserState();
  }
}

final globalUserProvider =
    NotifierProvider<GlobalUserNotifier, UserState>(GlobalUserNotifier.new);
