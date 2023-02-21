require 'bank_account'
require 'date'

RSpec.describe BankAccount do
  context "when a deposit is made into the account" do
    it "updates current balance" do
      account = BankAccount.new
      account.deposit(1000, Date.new(2023, 1, 10))
      account.deposit(500, Date.new(2023, 1, 13))
      expect(account.balance).to eq(1500)
    end
  end

  context "when withdraw from account" do
    it "updates current balance" do
      account = BankAccount.new
      account.deposit(1000, Date.new(2023, 1, 10))
      account.deposit(500, Date.new(2023, 1, 13))
      account.withdraw(750, Date.new(2023, 1, 14))
      expect(account.balance).to eq(750)
    end
  end

  context "if not enough balance" do
    it "fails to withdraw" do
      account = BankAccount.new
      account.deposit(1000, Date.new(2023, 1, 10))
      expect { account.withdraw(1100, Date.new(2023, 1, 12)) }.to raise_error "You don't have credit."
    end
  end

  context "when withdraw from account" do
    it "updates current balance" do
      account = BankAccount.new
      account.deposit(250, Date.new(2023, 1, 15))
      expect(account.format_statement).to include("250.00")
    end
  end
end
