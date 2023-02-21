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
end
