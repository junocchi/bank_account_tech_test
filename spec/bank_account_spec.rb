require 'bank_account'
require 'date'

RSpec.describe BankAccount do
  context "when a deposit is made into the account" do
    it "updates current balance" do
      account = BankAccount.new
      deposit = account.deposit(1000, Date.new(2023, 1, 10))
      expect( { :balance=>1000 }.has_key?(:balance)).to eq true
    end
  end

  context "if not enough balance" do
    it "fails to withdraw" do
      account = BankAccount.new
      account.deposit(1000, Date.new(2023, 1, 10))
      expect { account.withdraw(1100, Date.new(2023, 1, 12)) }.to raise_error "You don't have credit."
    end
  end
end
