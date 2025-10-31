import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkVotingStatus();
  }

  Future<void> _checkVotingStatus() async {
    // Wait for 2 seconds to show splash screen
    await Future.delayed(const Duration(seconds: 2));

    // Check if user has already voted
    final prefs = await SharedPreferences.getInstance();
    final hasVoted = prefs.getBool('already_voted') ?? false;

    if (!mounted) return;

    if (hasVoted) {
      // User has already voted, lock the app
      Navigator.pushReplacementNamed(context, '/already_voted');
    } else {
      // User hasn't voted, proceed to login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Voting Icon
            Container(
              height: 200,
              width: 200,
              child: Image.asset('assets/icon.png'),
            ),
            const SizedBox(height: 24),
            // App Title
            const Text(
              'Trust - Evo',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your Vote, Your Voice',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 48),
            // Loading Indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
