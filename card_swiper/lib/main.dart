import 'package:card_swiper/example_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'example_candidate_model.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example(),
    ),
  );
}

class Example extends StatefulWidget {
  const Example({
    super.key,
  });

  @override
  State<Example> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<Example> {
  final CardSwiperController controller = CardSwiperController();
  final List<Candidate> candidates = [
    Candidate(name: 'Alice', age: 30),
    Candidate(name: 'Bob', age: 24),
    Candidate(name: 'Charlie', age: 29),
    Candidate(name: 'Funky', age: 25),
  ];

  late final List<Widget> cards;

  @override
  void initState() {
    super.initState();
    cards = candidates
        .asMap()
        .entries
        .map((entry) => ExampleCard(candidate: entry.value, cardIndex: entry.key))
        .toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          'Card Swiper Example',
          style: TextStyle(color: Colors.black),
        ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Flexible(
            child: CardSwiper(
              controller: controller,
              cardsCount: cards.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 3,
              backCardOffset: const Offset(40, 40),
              padding: const EdgeInsets.all(24.0),
              cardBuilder: (
                context,
                index,
                horizontalThresholdPercentage,
                verticalThresholdPercentage,
              ) =>
                  cards[index],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: controller.undo,
                  child: const Icon(Icons.rotate_left),
                  backgroundColor: Colors.blue.shade200,
                  foregroundColor: Colors.black87,
                ),
                FloatingActionButton(
                  onPressed: () => controller.swipe(CardSwiperDirection.left),
                  child: const Icon(Icons.keyboard_arrow_left),
                  backgroundColor: Colors.blue.shade200,
                  foregroundColor: Colors.black87,
                ),
                FloatingActionButton(
                  onPressed: () =>
                      controller.swipe(CardSwiperDirection.right),
                  child: const Icon(Icons.keyboard_arrow_right),
                  backgroundColor: Colors.blue.shade200,
                  foregroundColor: Colors.black87,
                ),
                FloatingActionButton(
                  onPressed: () => controller.swipe(CardSwiperDirection.top),
                  child: const Icon(Icons.keyboard_arrow_up),
                  backgroundColor: Colors.blue.shade200,
                  foregroundColor: Colors.black87,
                ),
                FloatingActionButton(
                  onPressed: () =>
                      controller.swipe(CardSwiperDirection.bottom),
                  child: const Icon(Icons.keyboard_arrow_down),
                  backgroundColor: Colors.blue.shade200,
                  foregroundColor: Colors.black87,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
