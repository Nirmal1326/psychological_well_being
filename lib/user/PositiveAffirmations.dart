import 'package:flutter/material.dart';

class PositiveAffirmationsScreen extends StatelessWidget {
  final String selectedMood;

  PositiveAffirmationsScreen({required this.selectedMood});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Positive Affirmations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Daily Affirmations for $selectedMood mood:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildAffirmationCard(_getAffirmation(selectedMood, 1)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildAffirmationCard(_getAffirmation(selectedMood, 2)),
            ),
            // Add more cards for additional affirmations
          ],
        ),
      ),
    );
  }

  Card _buildAffirmationCard(String affirmation) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          affirmation,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  String _getAffirmation(String mood, int affirmationNumber) {
    switch (mood) {
      case 'Happy':
        return _getHappyAffirmation(affirmationNumber);
      case 'Sad':
        return _getSadAffirmation(affirmationNumber);
      default:
        return _getNeutralAffirmation(affirmationNumber);
    }
  }

  String _getHappyAffirmation(int affirmationNumber) {
    switch (affirmationNumber) {
      case 1:
        return 'Happy Affirmation 1: I am surrounded by love and joy.';
      case 2:
        return 'Happy Affirmation 2: I am grateful for the happiness in my life.';
      default:
        return 'No affirmation available for this number.';
    }
  }

  String _getSadAffirmation(int affirmationNumber) {
    switch (affirmationNumber) {
      case 1:
        return 'Sad Affirmation 1: I am resilient and will overcome challenges.';
      case 2:
        return 'Sad Affirmation 2: My emotions are valid, and I am worthy of healing.';
      default:
        return 'No affirmation available for this number.';
    }
  }

  String _getNeutralAffirmation(int affirmationNumber) {
    switch (affirmationNumber) {
      case 1:
        return 'Neutral Affirmation 1: I am at peace with the present moment.';
      case 2:
        return 'Neutral Affirmation 2: I trust in my ability to handle whatever comes my way.';
      default:
        return 'No affirmation available for this number.';
    }
  }
}
