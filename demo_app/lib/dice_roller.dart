import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDice = 2;
  void rollDice() {
    var randomInt = Random().nextInt(6) + 1;
    setState(() {
      currentDice = randomInt;
    });
    print('clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/dice-images/dice-$currentDice.png', width: 200),
        ElevatedButton(onPressed: rollDice, child: const Text('Roll Dice')),
      ],
    );
  }
}
