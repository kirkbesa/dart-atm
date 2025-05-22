import 'dart:io';
import './ask_input.dart';

var InitialPin = '0000'; // Default pin
const triesLimit = 3;
var currentTries = 0;

bool EnterPin() {
    // As long as limit is not reached:
    while (currentTries < triesLimit) {
        String? pin = AskInput('Enter your ATM PIN');

        // Validate if pin is correct
        if (pin == InitialPin) {
            return true; // Success entering pin
        }

        currentTries++;
        print('Incorrect Pin!');
        print('Tries left: ${triesLimit - currentTries}\n');
    }

    // Exceeded limit
    print('Exceeded number of tries! Try again later.');
    return false; // Failed entering pin (to be checked in main menu)
}