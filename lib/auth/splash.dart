import 'package:flutter/material.dart';
import 'package:psychological_well_being/auth/login.dart';
import 'package:psychological_well_being/user/wellbeingscreen.dart';

import '../main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (!mounted) {
      return;
    }
    final session = supabase.auth.currentSession;
    final user = await supabase.auth.currentUser;
    if (session != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WellBeingScreen(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
