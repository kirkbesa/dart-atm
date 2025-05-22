import '../helpers/ask_input.dart';
import '../helpers/account_state.dart';

void DepositMoney() {
  print('\n--- Deposit Money ---');

  double? amount;

  while (true) {
    String? input = AskInput('Enter amount to deposit (or "cancel" to exit)');

    if (input == null || input.isEmpty) {
      print('Please enter a valid amount.');
      continue;
    }

    if (input.toLowerCase() == 'cancel') {
      print('Deposit cancelled.\n');
      return;
    }

    try {
      amount = double.parse(input);

      if (amount <= 0) {
        print('Amount must be greater than zero.');
        continue;
      }

      AccountState.currentBalance += amount;
      print(
        'Deposit successful. New balance: \$${AccountState.currentBalance.toStringAsFixed(2)}\n',
      );
      return;
    } catch (e) {
      print('Invalid amount. Please enter a number.');
    }
  }
}
