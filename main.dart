import 'dart:io';
import './helpers/ask_input.dart';
import './helpers/commands.dart';
import './helpers/enter_pin.dart';
import './helpers/exit_app.dart';

// -------------- Main Entry Point -------------- 
void main() {
  // Initiate App, Ask Pin first
  print('Welcome to the ATM!');
  if (EnterPin() == false) {
    exitApp(); // Exit if enter pin exceeds 3 tries
  }

  // ON SUCCESS
  // Display Available Commands
  print('User Authorized.\nWelcome to the ATM!');
  displayCommands();

  // Main Menu - Input Loop
  askCommand();
}





