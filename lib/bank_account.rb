class BankAccount
  
  attr_reader :name 
  attr_accessor :balance, :status 
  
  @@all = []

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
    @@all << self
  end
  
  def deposit(money)
    @balance = @balance + money
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid? 
    @status == "open" && @balance > 0 ? true : false
  end
  
  def close_account 
    @status = "closed"
  end

end
