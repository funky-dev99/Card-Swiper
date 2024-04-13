import 'package:flutter/material.dart';
import 'example_candidate_model.dart';

class ExampleCard extends StatelessWidget {
  final Candidate candidate;
  final int cardIndex;  // Add a field for the index

  const ExampleCard({
    Key? key,
    required this.candidate,
    required this.cardIndex,  // Require an index
  }) : super(key: key);

  // Define a list of gradients
  static final List<LinearGradient> cardGradients = [
    LinearGradient(colors: [Colors.pink, Colors.redAccent]),
    LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
    LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
    LinearGradient(colors: [Colors.purple, Colors.deepPurple]),
  ];

  @override
  Widget build(BuildContext context) {
    // Use the index to select a gradient
    final gradient = cardGradients[cardIndex % cardGradients.length];

    return Container(
      width: double.infinity, // take the full width available
      height: 550, // define a fixed height for each card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: gradient,  // Apply the gradient here
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 450,
              decoration:BoxDecoration(
                  gradient: gradient
              ) ,
            ),
            ListTile(
              title: Text(candidate.name, style: TextStyle(color: Colors.black)),
              subtitle: Text('Age: ${candidate.age}', style: TextStyle(color: Colors.black54)),
              trailing: Icon(Icons.more_horiz, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
