import 'dart:io';

String currentPin = '0000'; // Global variable for current PIN

// Function to change PIN
void ChangePin() {
  stdout.write('Enter current PIN: ');
  String? enteredPin = stdin.readLineSync();

  // Check if entered PIN is correct
  if (enteredPin == currentPin) {
    stdout.write('Enter new PIN: ');
    String? newPin = stdin.readLineSync();

    stdout.write('Confirm new PIN: ');
    String? confirmPin = stdin.readLineSync();

    // Validate new PIN: check if both match and the PIN is 4 digits
    if (newPin == confirmPin && newPin != null && newPin.length == 4) {
      currentPin = newPin; // Update the global PIN
      print('PIN successfully changed.');
    } else {
      print('PINs do not match or are invalid. Please try again.');
    }
  } else {
    print('Incorrect current PIN. Please try again.');
  }
}

void main() {
  // Example to call ChangePin function directly
  print('Welcome to the ATM!');

  // Simulate changing the PIN
  ChangePin();

  // After changing, print the updated PIN (for demonstration, though you wouldn't show the PIN in real use)
  print('Updated PIN: $currentPin');
}
