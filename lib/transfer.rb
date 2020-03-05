class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount = "1000")
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid? ? true : false
  end
  
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end
  
end


#if @sender.balance < @amount
       ##
       #"Transaction rejected. Please check your account balance."
        
    #elsif
     # @status == "complete"
     # puts "Transaction was already completed"
      
    #else
     # @sender.deposit(@amount * -1)
     # @receiver.deposit(@amount)
     # @status = "complete"
    #end
