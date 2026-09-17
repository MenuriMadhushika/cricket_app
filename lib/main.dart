import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CricketApp(),
    );
  }
}

class CricketApp extends StatefulWidget {
  const CricketApp({super.key});

  @override
  State<CricketApp> createState() => _CricketAppState();
}

class _CricketAppState extends State<CricketApp> {
  int totalRuns = 0;
  int balls = 6;
  String result = '';

  // Called when the Bat button is pressed
  void bat() {
    if (balls > 0) {
      setState(() {
        // Generate a random score from 0 to 6
        int randomRun = Random().nextInt(7);

        totalRuns += randomRun;
        balls--;

        if (randomRun == 0) {
          result = 'No Runs';
        } else if (randomRun == 1) {
          result = '1 Run';
        } else {
          result = '$randomRun Runs';
        }
      });
    }
  }

  // Restart the game
  void restart() {
    setState(() {
      totalRuns = 0;
      balls = 6;
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Mini Cricket'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Bat and Ball icons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.sports_cricket,
                  size: 100,
                  color: Colors.white,
                ),

                SizedBox(width: 40),

                Icon(
                  Icons.sports_baseball,
                  size: 100,
                  color: Colors.red,
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Runs and Balls labels
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  child: Text(
                    'Runs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                  width: 140,
                  child: Text(
                    'Balls',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            // Runs and Balls values
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  child: Text(
                    '$totalRuns',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                  width: 140,
                  child: Text(
                    '$balls',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Result of the current ball
            Text(
              result,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Bat / Restart button
            ElevatedButton(
              onPressed: balls > 0 ? bat : restart,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    balls > 0 ? Colors.blue[900] : Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text(
                balls > 0 ? 'Bat' : 'Restart',
              ),
            ),
          ],
        ),
      ),
    );
  }
}