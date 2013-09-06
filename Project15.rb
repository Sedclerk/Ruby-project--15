class Account
    
    attr_accessor :account_holder, :balance
    
    def initialize (name)
        
        @balance = 0
        
        @account_holder = name
        
        if name == nil
            
            puts "Invalid input , that is not a name my friend"
            
            else
            
            puts "#{@account_holder}"
            
        end
        
    end
    
    def deposit(money)
        
        if money.is_a? String
            
            money = money.sub(/\$/, "").to_f
            
        end
        
        if money > 0
            
            @balance += money
            
            puts "Deposited $#{money}. Your new balance is $#{'%.2f' % @balance}"
            
            else
            
            puts "Error: Invalid Input on Deposit"
            
        end
        
    end
    
    def withdrawal(money)
        
        if money.is_a? String
            
            money = money.sub(/\$/, "").to_f
            
        end
        
        if money > 0 && money <= @balance
            
            @balance -= money
            
            puts "You took $#{money} amount. Your new balance is $#{'%.2f' % @balance}"
            
            elsif money > @balance
            
            puts " Sorry, you are broke. You only have this $#{'%.2f' % @balance} left on your account"
            
            else
            
            puts "Error: Invalid Input on Withdrawal"
            
        end
        
    end
    
    def transfer(money, other_client)
        
        if money.is_a? String
            
            money = money.sub(/\$/, "").to_f
            
        end
        
        if money > 0 && money <= @balance
            
            @balance -= money
            
            other_client.deposit(money)
            
            puts "Deposited $#{money} to #{other_client.account_holder}'s account. Your current balance  is $#{'%.2f' % @balance}"
            
            elsif money > @balance
            
            puts " Sorry, you are broke. You only have this $#{'%.2f' % @balance} left on your account"
            
            else
            puts "Error: Invalid Input on Transfer to Client:#{other_client}"
        end
    end
    
end

a = Account.new ('Steve')

a.deposit('$40.45')

a.withdrawal('$20.15')

b = Account.new ('Jeron')

b.deposit('$100.25')

a.transfer('$20.25', b)

a.transfer('$30.25', b)

a.withdrawal('$50')

a.deposit('cows')

c = Account.new (nil)

a.withdrawal(-55)
