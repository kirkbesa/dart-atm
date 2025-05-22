import '../features/balance_inquiry.dart';
import '../features/withdraw_cash.dart';
import '../features/transfer_money.dart';
import '../features/deposit_money.dart';
import '../features/pay_bills.dart';
import '../features/change_pin.dart';
import './exit_app.dart';
import './ask_input.dart';

// Defined commands here with expected input, display, and function
const Map<String, Map<String, Function>> commands = {
  '1': {'[1] Balance Inquiry': BalanceInquiry},
  '2': {'[2] Withdraw Cash': WithdrawCash},
  '3': {'[3] Transfer Money': TransferMoney},
  '4': {'[4] Deposit Money': DepositMoney},
  '5': {'[5] Pay Bills': PayBills},
  '6': {'[6] Change Pin': ChangePin},
  'help': {'[help] View Available Commands': displayCommands},
  'exit': {'[exit] Exit': exitApp},
};

// Function that displays commands that are defined on top ^
void displayCommands() {
  print('Available Commands:'); 
  commands.forEach((key, value) {
    print('${value.keys.first}');
  });
}

// Function that asks and runs a command, 
// Runs indefinitely, 
// Still runs after finishing a feature unless exited
void askCommand() {
  while (true) {
    String? input = AskInput('Enter a command (type "help" to view options)');

    if (input == null || input.isEmpty) {
      print('No input provided.');
      continue;
    }

    if (commands.containsKey(input)) {
      commands[input]!.values.first(); // Call the function
    } else {
      print('Invalid command. Type "help" to view available options.');
    }
  }
}