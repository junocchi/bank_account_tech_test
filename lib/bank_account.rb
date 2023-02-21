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
end

# account = BankAccount.new
# account.deposit(1000, Date.new(2023, 1, 10))