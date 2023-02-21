# Bank Account Class Design Recipe

## 1. Describe the Problem - user story

As a user, I want to be able to make deposits to my account (pay-in) 
  It should store the transaction's date, amount and balance
As a user, I want to be able to remove funds from my account (withdrawal)
  It should store the transaction's date, amount and balance
As a user, I want to be able to print my bank statement
  It should return and print all transaction's dates, amounts and balances


## 2. Design the Class System

_Consider diagramming out the class and its methods._

```
┌────────────────────────────┐
│ BankAccount                │
│ - initialize               │
│ - deposit(amount)          │
│ - withdraw(amount)         │
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

_Also design the interface of the class in more detail._

```ruby
class BankAccount
  def initialize
    # ...
  end

  def deposit(amount, date)
    # Amount gets added to balance
    # Date of deposit gets added to transactions
    # Returns nothing
  end

  def withdraw(amount, date)
    # Fails if there's not enough funds
    # Amount gets added to balance
    # Date of deposit gets added to transactions
    # Returns nothing
  end

  def print_statement
    # Puts "date || credit || debit || balance"
    # Returns a list of transactions (with date, amount, balance)
  end
end

```

## 3. Create Examples as Tests

_Create examples of the method being called with particular arguments, and what the method should return in each situation._

```ruby
# EXAMPLE

#1 Updates current balance
account = BankAccount.new
account.deposit(1000, Date.new(2023, 1, 10)) # => to include :balance=>1000

#2 Prints the statment after paying into bank account
account = BankAccount.new
account.deposit(1000, Date.new(2023, 1, 10))
account.deposit(2000, Date.new(2023, 1, 13))
account.print_statement() # => 
# date || credit || debit || balance
# 13/01/2023 || 2000.00 || || 3000.00
# 10/01/2023 || 1000.00 || || 1000.00


#3 Prints the statment after withdrawing from bank account
account = BankAccount.new
account.deposit(1000, Date.new(2023, 1, 10))
account.deposit(2000, Date.new(2023, 1, 13))
account.withdraw(500, Date.new(2023, 1, 14))
account.print_statement() # => 
# date || credit || debit || balance
# 14/01/2023 || || 500.00 || 2500.00
# 13/01/2023 || 2000.00 || || 3000.00
# 10/01/2023 || 1000.00 || || 1000.00

#4 It fails when insufficient funds
account = BankAccount.new
account.deposit(500, Date.new(2023, 1, 10))
account.withdraw(700, Date.new(2023, 1, 14)) # => it fails

```

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._