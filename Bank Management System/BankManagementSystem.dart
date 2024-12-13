// BankManagementSystem.dart

// abstract class
abstract class Account {
  int accountNumber;
  double balance;

  // constructor
  Account(this.accountNumber, this.balance);

  // deposit methods
  void deposit(double amount) {
    if (amount < 0) {
      print("Invalid amount.");
      return;
    }

    balance += amount;
    print("Deposited $amount, new balance is $balance.");
  }

  void withdraw(double amount); // abstract method
}

// derived classes
class SavingsAccount extends Account {
  double interestRate;

  // constructor
  SavingsAccount(int accountNumber, double initialBalance, this.interestRate)
      : super(accountNumber, initialBalance);

  @override
  void withdraw(double amount) {
    if (amount < 0) {
      print("Invalid amount.");
    } else if (amount <= balance) {
      balance -= amount;
      print("Withdrew $amount, new balance is $balance.");
      applyInterestRate();
    } else {
      print("Insufficient funds.");
    }
  }

  // apply interest rate after withdraw
  void applyInterestRate() {
    balance *= (1 + interestRate);
    print("Interest applied, new balance is $balance.");
  }
}

// derived class
class CurrentAccount extends Account {
  double overdraftLimit;

  // constructor
  CurrentAccount(int accountNumber, double initialBalance, this.overdraftLimit)
      : super(accountNumber, initialBalance);

  @override
  void withdraw(double amount) {
    if (amount < 0) {
      print("Invalid amount.");
    } else if (amount <= balance + overdraftLimit) {
      balance -= amount;
      print("Withdrew $amount, new balance is $balance.");
    } else {
      print("Insufficient funds.");
    }
  }
}

void main() {
  // create savings account
  SavingsAccount savings = SavingsAccount(12345, 1000.0, 0.05);
  print("Savings account:");
  savings.deposit(500.0);
  savings.deposit(-100.0); // Invalid amount
  savings.withdraw(2000.0); // Insufficient funds
  savings.withdraw(350.0);

  // create current account
  CurrentAccount current = CurrentAccount(67890, 500.0, 200.0);
  print("\nCurrent account:");
  current.deposit(300.0);
  current.withdraw(-100.0); // Invalid amount
  current.withdraw(600.0);
  current.withdraw(450.0); // exceeds overdraft limit -> Insufficient funds
  current.withdraw(400.0); // allowed due to overdraft limit
}
