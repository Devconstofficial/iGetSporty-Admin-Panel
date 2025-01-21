import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/services/shared_preferences.dart';
import 'package:iget_sporty_admin_panel/views/pages/auth/login_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/side_bar/side_bar_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final PreferencesService prefs = PreferencesService();
  bool? isLogin;

  @override
  void initState() {
    super.initState();
    getUserLogin();
  }

  Future<void> getUserLogin() async {
    final loginStatus = await prefs.getUserLogin();
    setState(() {
      isLogin = loginStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isLogin == true) {
        Get.offAll(() => const SideBarScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    });

    return const SizedBox.shrink();
  }
}
