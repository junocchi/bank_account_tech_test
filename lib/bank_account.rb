class BankAccount
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    @balance += amount
    @transactions << { 
      date: date, 
      credit: amount, 
      debit: nil, 
      balance: @balance
    }
  end

  def withdraw(amount, date)
    if amount > @balance
      fail "You don't have credit."
    else
      @balance -= amount
      @transactions << { 
        date: date, 
        credit: nil,
        debit: amount, 
        balance: @balance
      }
    end
  end
end

# account = BankAccount.new
# account.deposit(1000, Date.new(2023, 1, 10))