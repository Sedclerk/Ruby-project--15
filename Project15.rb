class Account
   attr_accessor :balance, :account_holder

def initialize
    @balance = 0
end

def empty?
    @balance == 0
  end

def deposit(money)
  if money.is_a? String
    money = money.sub(/\$/, "").to_f
  end
  if money > 0 && money !~ /\w+/
    @balance += money
  else
    puts "Error: Invalid Input on Deposit"
  end
end
def withdraw(money)
   if money.is_a? String
    money = money.sub(/\$/, "").to_f
   end
   if money > 0 && @balance >= money && money !~ /\w+/
    @balance -= money
   else
    puts "Error: Invalid Input on Withdrawal"
   end
end
def transfer(money, other_client)
  if money.is_a? String
    money = money.sub(/\$/, "").to_f
  end
  if money > 0 && @balance >= money && money !~ /\w+/ && defined? other_client 
    @balance -= money
    other_client.deposit(money)
  else
    puts "Error: Invalid Input on Transfer to Client:#{other_client}"
  end
 end
def num_clients()
  return @@num_clients
end
def print_account()
  puts "#{@account_holder} ---- #{'%.2f' % @balance}"
end
end

