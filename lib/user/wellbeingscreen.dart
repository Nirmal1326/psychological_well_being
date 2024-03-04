import 'package:flutter/material.dart';
import 'package:psychological_well_being/user/relaxationvideo.dart';
import 'PositiveAffirmations.dart';
import 'RelaxationExercises.dart';

class WellBeingScreen extends StatefulWidget {
  @override
  _WellBeingScreenState createState() => _WellBeingScreenState();
}

class _WellBeingScreenState extends State<WellBeingScreen>
    with TickerProviderStateMixin {
  String currentMood = "Neutral"; // Default mood
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF387ADF),
        title: Text('Well-Being Companion'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Mood: $currentMood',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openMoodSelectionDialog();
              },
              child: Text('Select Mood'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openRelaxationExercises();
              },
              child: Text('Relaxation Exercises'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openAffirmations();
              },
              child: Text('Positive Affirmations'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openRelaxationVideo();
              },
              child: Text('Relaxation Video'),
            ),
          ],
        ),
      ),
    );
  }

  _openMoodSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Mood'),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Set to min to reduce the size
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildMoodButton('Happy', 'Happy'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildMoodButton('Sad', 'Sad'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildMoodButton('Neutral', 'Neutral'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMoodButton(String mood, String buttonText) {
    return ElevatedButton(
      onPressed: () {
        _updateMood(mood);
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).colorScheme.secondary,
      ),
      child: Text(buttonText),
    );
  }

  _updateMood(String mood) {
    setState(() {
      currentMood = mood;
    });
  }

  _openRelaxationExercises() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            RelaxationExercisesScreen(selectedMood: currentMood),
      ),
    );
  }

  _openAffirmations() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PositiveAffirmationsScreen(selectedMood: currentMood),
      ),
    );
  }

  _openRelaxationVideo() {
    // Placeholder for navigation to Relaxation Video screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RelaxationVideoScreen(),
      ),
    );
  }
}
