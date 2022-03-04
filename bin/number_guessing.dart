import 'dart:io';
import 'dart:math';
import 'package:number_guessing/components/console_menu.dart';
import 'package:number_guessing/utils/console_utils.dart';

void main() {
  playGame();
}

int rollDie(int sides) => Random().nextInt(sides) + 1;

void playGame() {
  final maxNumber = promptForIntExt("Max Number: ");
  final number = rollDie(maxNumber);
  int score = 0;
  bool gameWon = false;

  while (gameWon == false) {
    final input = promptForIntExt("Guess: ");

    if(input <= maxNumber) {
      score++;
      if(input == number) {
        print("Correct!");
        print("Lower Scores Are Better.");
        print("Score: $score");
        gameWon = true;
      } else if (input < number) {
        print("Too Low");
      } else {
        print("Too High");
      }
    } else {
      print("Your Number Is Higher Than The Max Number");
    }
  }

  printPlayAgainMenu();
}

void printPlayAgainMenu() {
  printConsoleMenu([
    const ConsoleMenuOption("Play Again", onSelect: playGame),
    ConsoleMenuOption("Exit", onSelect: () => exit(0)),
  ]);
}