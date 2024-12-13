# Bank Management System

Define an **abstract** class **Account** with the following properties:

-   `accountNumber` (integer)
-   `balance` (double)

It should also have the following methods:

-   `deposit(double amount)`: Adds the specified amount to the account balance
-   `withdraw(double amount)`: Abstract method that deducts the specified amount from the account balance

Define a class **SavingsAccount** that extends the **Account** class. It should have an additional property called `interestRate` (double):

Implement the **withdraw()** method in the SavingsAccount class as follows:

-   Subtract the specified amount from the account balance.
-   Apply the interest rate to the remaining balance.

Define a class **CurrentAccount** that extends the **Account** class. It should have an additional property called `overdraftLimit` (double)

Implement the **withdraw()** method in the CurrentAccount class as follows:

-   Allow withdrawals up to the overdraft limit.
-   If the withdrawal amount exceeds the overdraft limit, print a message indicating insufficient funds

In main()

-   Create an instance of the **SavingsAccount** class by providing values for the _account number_, _initial balance_, and _interest rate_.
-   Use the instance to perform operations like depositing and withdrawing money.
-   Create an instance of the **CurrentAccount** class by providing values for the _account number_, _initial balance_, and _overdraft limit_.
-   Use the instance to perform operations like depositing and withdrawing money.
