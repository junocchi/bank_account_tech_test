# Bank Account tech test

## 1. User story and criteria

As a user, I want to be able to make deposits to my account (pay-in) 
  It should store the transaction's date, amount and balance
As a user, I want to be able to remove funds from my account (withdrawal)
  It should store the transaction's date, amount and balance
As a user, I want to be able to print my bank statement
  It should return and print all transaction's dates, amounts and balances


* You should be able to interact with the code via a REPL like IRB.  (You don't need to implement a command line interface that takes input from STDIN.)
* Data is kept in memory.

## 2. Design of the Class System
```
Initially, I considered the class with the methods initialize, deposit, withdraw and print_statement. However, once I started writing the tests, I realized that I would not be able to test some of the functionalities in print_statement and decided to add the format_statement method too.

┌────────────────────────────┐
│ BankAccount                │
│ - initialize               │
│ - deposit(amount, date)    │
│ - withdraw(amount, date)   │
│ - format_statement         │
│ - print_statement          │
│   => [transactions...]     │
└───────────┬────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ - dates                 │
│ - deposits              │
│ - withdrawals           │
│ - balance               │
└─────────────────────────┘
```

Methods:
- initialize: sets the balance (to 0) and transactions (creates an empty array)

- deposit: receives two arguments, amount and date. The user is able to add funds to their account and the transactions’ information will be stored.

- withdraw: receives two arguments, amount and date. The user is able to withdraw funds from their account, if they have enough credit, and the transactions’ information will be stored.

- format_statement: formats the way the statement will look, according to the given criteria. It adds a statement header, and the following information for each transaction: date (reverse chronological order), the amount credited or withdrawn, and current balance.

- print_statement: prints the statement according to the given criteria.

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00

```

## 3. Testing and Dependencies


We can run all of our tests at once with 'RSpec'.

The code is passing all tests.

Tested for the following functionalities:
- making a deposit and updating the current balance
- withdrawing and updating the current balance
- raising an error if not enough balance
- checking if the to-float functionality has been implemented

To run the program and its tests you will need to have Ruby and bundler (which manages dependencies like RSpec) installed.

To set up the project I followed the following:

```
rvm get stable
rvm use ruby --latest --install --default
gem install bundler
bundle init
bundle add rspec
rspec --init
git init .
git add .
git commit -m "Project setup"

```
