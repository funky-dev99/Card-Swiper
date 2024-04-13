import 'package:flutter/material.dart';
import 'example_candidate_model.dart';

class ExampleCard extends StatelessWidget {
  final Candidate candidate;

  const ExampleCard({Key? key, required this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(candidate.name),
        subtitle: Text('Age: ${candidate.age}'),
      ),
    );
  }
}
