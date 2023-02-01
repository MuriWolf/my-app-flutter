import 'dart:math';

int generateRandomNumber(int max) {
  Random num = Random();
  return num.nextInt(max);
}