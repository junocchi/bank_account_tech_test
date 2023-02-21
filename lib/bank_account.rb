require 'date'

class BankAccount
  attr_reader :transactions
  attr_reader :balance

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

  def format_statement
    statement = "date || credit || debit || balance\n"
    @transactions.reverse_each do |transaction|
      date = transaction[:date].strftime('%d/%m/%Y')
      credit = format('%.2f', transaction[:credit]) if transaction[:credit]
      debit = format('%.2f', transaction[:debit]) if transaction[:debit]
      balance = format('%.2f', transaction[:balance])
      statement += "#{date} || #{credit || ''} || #{debit || ''} || #{balance}\n"
    end
    return statement
  end

  def print_statement
    puts format_statement
  end
end


# account = BankAccount.new
# account.deposit(1000, Date.new(2023, 1, 10))
# account.deposit(2000, Date.new(2023, 1, 13))
# account.withdraw(500, Date.new(2023, 1, 14))
# account.print_statement