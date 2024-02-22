import 'package:flutter/material.dart';
import 'PositiveAffirmations.dart';
import 'RelaxationExercises.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Well-Being App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // You can choose your primary color
          accentColor: Colors.orange, // You can choose your accent color
        ),
        fontFamily: 'Roboto',
      ),
      home: WellBeingScreen(),
    );
  }
}

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
        title: Text('Well-Being Companion'),
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
          ],
        ),
      ),
    );
  }

  // _openMoodSelectionDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Select Mood'),
  //         content: Column(
  //           children: [
  //             ElevatedButton(
  //               onPressed: () {
  //                 _updateMood("Happy");
  //                 Navigator.pop(context);
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 primary: Theme.of(context).colorScheme.secondary,
  //               ),
  //               child: Text('Happy'),
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 _updateMood("Sad");
  //                 Navigator.pop(context);
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 primary: Theme.of(context).colorScheme.secondary,
  //               ),
  //               child: Text('Sad'),
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 _updateMood("Neutral");
  //                 Navigator.pop(context);
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 primary: Theme.of(context).colorScheme.secondary,
  //               ),
  //               child: Text('Neutral'),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

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
                _buildMoodButton('Happy', 'Happy'),
                _buildMoodButton('Sad', 'Sad'),
                _buildMoodButton('Neutral', 'Neutral'),
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
}
