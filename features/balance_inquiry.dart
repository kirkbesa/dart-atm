import '../helpers/account_state.dart';

void BalanceInquiry() {
  print(
    '\nYour current balance is: ₱${AccountState.currentBalance.toStringAsFixed(2)}\n',
  );
}
