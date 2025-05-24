import '../helpers/ask_input.dart';
import '../helpers/account_state.dart';

class Bill {
  String name;
  double amount;
  bool isPaid;

  Bill(this.name, this.amount, [this.isPaid = false]);

  @override
  String toString() {
    return '${isPaid ? "[PAID]" : "[DUE]"} \$${amount.toStringAsFixed(2)} - $name';
  }
}

final List<Bill> Bills = [
  Bill("Electricity", 40.15),
  Bill("Water", 27.83),
  Bill("Internet", 39.99),
];

void PayBills() {
  print('==== Pay Bills ====');
  print('Current Balance: \$${AccountState.currentBalance.toStringAsFixed(2)}\n');

  void printBills() {
    for (int i = 0; i < Bills.length; i++) {
      final bill = Bills[i];
      print('${i + 1}. ${bill}');
    }
  }

  printBills();

  String? input = AskInput('\nEnter the number of a bill to pay (or "q" to quit)');

  while (input != null && input.toLowerCase() != 'q') {
    int? index = int.tryParse(input);

    if (index != null && index > 0 && index <= Bills.length) {
      Bill bill = Bills[index - 1]; // Adjust for 1-based indexing
      if (bill.isPaid) {
        print("That bill is already paid.");
      } else if (AccountState.currentBalance >= bill.amount) {
        AccountState.currentBalance -= bill.amount;
        bill.isPaid = true;
        print("Paid ${bill.name} for \$${bill.amount.toStringAsFixed(2)}.");
        print("Remaining Balance: \$${AccountState.currentBalance.toStringAsFixed(2)}");
      } else {
        print("Insufficient balance to pay for ${bill.name}.");
      }
    } else {
      print("Invalid bill number.");
    }

    print("\nUpdated Bill Status:");
    printBills();

    input = AskInput('\nEnter another bill number to pay (or "q" to quit)');
  }

  print("\nExiting Pay Bills Page.");
}
