import '../helpers/ask_input.dart';
import '../helpers/account_state.dart';

void WithdrawCash() {
  print('\n--- Withdraw Cash ---');

  double? amount;

  while (true) {
    String? input = AskInput('Enter amount to withdraw (or "cancel" to exit)');

    if (input == null || input.isEmpty) {
      print('Please enter a valid amount.');
      continue;
    }

    if (input.toLowerCase() == 'cancel') {
      print('Withdrawal cancelled.\n');
      return;
    }

    try {
      amount = double.parse(input);

      if (amount <= 0) {
        print('Amount must be greater than zero.');
        continue;
      }

      if (amount > AccountState.currentBalance) {
        print(
          'Insufficient funds. Your balance is \$${AccountState.currentBalance.toStringAsFixed(2)}',
        );
        continue;
      }

      AccountState.currentBalance -= amount;
      print(
        'Withdrawal successful. New balance: \$${AccountState.currentBalance.toStringAsFixed(2)}\n',
      );
      return;
    } catch (e) {
      print('Invalid amount. Please enter a number.');
    }
  }
}
