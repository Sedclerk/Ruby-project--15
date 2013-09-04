class Account
   attr_accessor :account_holder, :balance
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
    if money > 0        
      @balance += money
      puts "Deposited $#{money}. Your new balance is $#{'%.2f' % @balance}"
    else 
      puts " Error, you added a negative sign , remove it and try again . Thanks"
    end
    
  end
 
  def withdrawal(money) 
    if money.is_a? String
      money = money.sub(/\$/, "").to_f
    end
    if money > 0        
      @balance -= money
      puts "You took $#{money} amount. Your new balance is $#{'%.2f' % @balance}"

    else 
      puts " Error, you added a negative sign , remove it and try again . Thanks"
    end
      
  end
 
  def transfer(money, other_client) 
    if money.is_a? String
      money = money.sub(/\$/, "").to_f
    end
    if money > 0   
      @balance -= money       
	    other_client.deposit(money)
      puts "Deposited $#{money} to #{other_client.account_holder}'s account. Your current balance  is $#{'%.2f' % @balance}"
    else 
      puts " Error, you added a negative sign , remove it and try again . Thanks"
    end

  end
 end

a = Account.new
a.account_holder = 'Steve'
a.deposit('$40.45')
a.withdrawal('$20.15')

b = Account.new
b.account_holder = 'Jeron'
b.deposit('$100.25')
a.transfer('$20.25', b)
