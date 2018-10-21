require 'pry'

class BankAccount

  attr_reader :name

  def initialize(name)
    @name = name
    @transaction = []
    add_transaction("Beginning Balance", 0)
  end

  def credit(description, amount)
    add_transaction(description, amount)
  end

  def debit(description, amount)
    add_transaction(description, -amount)
  end

  def add_transaction(description, amount)
     transactions = {
        description:  description,
        amount: amount
    }
    @transaction << transactions
  end

  def balance
    balance = 0.00
    @transaction.each do |transaction|
      balance += transaction[:amount]
    end
    balance
  end


  def print_register
    puts "\n"
    puts "#{name}'s Bank Account"
    puts "-" * 40
    puts "Description".ljust(30) + "Amount".rjust(10)
    @transaction.each do |transaction|
      puts transaction[:description].ljust(30) + transaction[:amount].to_s.rjust(10)
    end
    puts "-" * 40
    puts "Balance: #{balance.round(2)}"
    puts "-" * 40
  end

end

# Creating baking account an individual

bank_account = BankAccount.new("Victor")
puts bank_account.credit("Paycheck", 100)
bank_account.debit("Groceries", 41)
bank_account.debit("Food", 16.32)
puts bank_account

bank_account_2 = BankAccount.new("Hilsies")
puts bank_account_2.credit("Paycheck", 2365.43)
bank_account_2.debit("Groceries", 234.32)
bank_account_2.debit("Food", 78.92)
bank_account_2.credit("Paycheck", 675.12)
puts bank_account_2


puts "Register: "
bank_account.print_register
bank_account_2.print_register