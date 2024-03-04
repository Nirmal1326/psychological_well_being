import 'package:flutter/material.dart';

class RelaxationExercisesScreen extends StatelessWidget {
  final String selectedMood;

  RelaxationExercisesScreen({required this.selectedMood});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relaxation Exercises'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a Relaxation Exercise for $selectedMood mood:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildExerciseButton(context,
                  'Progressive Muscle Relaxation', _getExerciseDescription(1)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildExerciseButton(context, 'Deep Breathing Exercise',
                  _getExerciseDescription(2)),
            ),
            // Add more buttons for additional exercises
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildExerciseButton(
      BuildContext context, String title, String description) {
    return ElevatedButton(
      onPressed: () {
        _showExerciseDetails(context, title, description);
      },
      child: Text(title),
    );
  }

  String _getExerciseDescription(int exerciseNumber) {
    if (selectedMood == 'Happy') {
      return _getHappyExerciseDescription(exerciseNumber);
    } else if (selectedMood == 'Sad') {
      return _getSadExerciseDescription(exerciseNumber);
    } else {
      return _getNeutralExerciseDescription(exerciseNumber);
    }
  }

  String _getHappyExerciseDescription(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return 'Happy Exercise 1: Start by finding a comfortable position. Take deep breaths and think of positive memories. Relax each muscle group while focusing on the joyous moments in your life.';
      case 2:
        return 'Happy Exercise 2: Engage in a gratitude meditation. Reflect on things you are grateful for, expressing appreciation for the positive aspects of your life.';
      default:
        return 'No description available for this exercise.';
    }
  }

  String _getSadExerciseDescription(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return 'Sad Exercise 1: Practice mindful breathing. Inhale slowly, hold, and exhale. Allow yourself to feel and release sadness with each breath.';
      case 2:
        return 'Sad Exercise 2: Try a guided visualization. Imagine a peaceful place that brings comfort and solace, allowing your mind to temporarily escape from sadness.';
      default:
        return 'No description available for this exercise.';
    }
  }

  String _getNeutralExerciseDescription(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return 'Neutral Exercise 1: Focus on progressive muscle relaxation. Tense and release each muscle group, starting from your toes to your head, promoting overall relaxation.';
      case 2:
        return 'Neutral Exercise 2: Experiment with box breathing. Inhale for four counts, hold for four counts, exhale for four counts. Repeat to create a calming and centered feeling.';
      default:
        return 'No description available for this exercise.';
    }
  }

  _showExerciseDetails(BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
