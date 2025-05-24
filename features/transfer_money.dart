import '../helpers/ask_input.dart';
import '../helpers/account_state.dart';

// Available contacts to transfer money to
const Contacts = [
  {'name': 'John Doe', 'account': '1234567890'},
  {'name': 'Jane Smith', 'account': '0987654321'},
  {'name': 'Mike Johnson', 'account': '1122334455'},
];

void TransferMoney() {
  print('--- Transfer Money ---');
  print('Current Balance: ₱${AccountState.currentBalance.toStringAsFixed(2)}');

  // Step 1: Select contact to transfer to
  print('\nAvailable Contacts:');
  for (int i = 0; i < Contacts.length; i++) {
    print(
      '${i + 1}. ${Contacts[i]['name']} (Account: ${Contacts[i]['account']})',
    );
  }

  String? input = AskInput(
    '\nEnter the number of the contact to transfer to (or "q" to quit)',
  );

  // Exit if the user cancels or enters "q"
  if (input == null || input.toLowerCase() == 'q') {
    print('Transfer cancelled.');
    return;
  }

  int? contactIndex = int.tryParse(input);

  if (contactIndex == null ||
      contactIndex < 1 ||
      contactIndex > Contacts.length) {
    print('Invalid contact number.');
    return;
  }

  // Step 2: Ask for the transfer amount
  double transferAmount = askForValidAmount();

  // Step 3: Check if the user has sufficient balance
  if (transferAmount > AccountState.currentBalance) {
    print(
      'Insufficient funds. Your balance is ₱${AccountState.currentBalance.toStringAsFixed(2)}',
    );
  } else if (transferAmount <= 0) {
    print('Invalid transfer amount.');
  } else {
    // Step 4: Proceed with the transfer
    AccountState.currentBalance -= transferAmount;
    print(
      'Successfully transferred ₱${transferAmount.toStringAsFixed(2)} to ${Contacts[contactIndex - 1]['name']} (Account: ${Contacts[contactIndex - 1]['account']}).',
    );
    print(
      'Remaining Balance: ₱${AccountState.currentBalance.toStringAsFixed(2)}',
    );
  }
}

// Helper function to get a valid transfer amount
double askForValidAmount() {
  double amount = 0.0;
  bool validAmount = false;

  while (!validAmount) {
    String? input = AskInput('Enter amount to transfer:');

    if (input == null || input.isEmpty) {
      print('Please enter a valid amount.');
      continue;
    }

    try {
      amount = double.parse(input);

      if (amount <= 0) {
        print('Amount must be greater than zero.');
        continue;
      }

      validAmount = true;
    } catch (e) {
      print('Invalid amount. Please enter a valid number.');
    }
  }

  return amount;
}
