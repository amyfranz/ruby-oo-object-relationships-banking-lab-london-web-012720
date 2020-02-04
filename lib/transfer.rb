class Transfer
  #attr_accessor
  attr_reader :sender, :receiver, :amount, :status

  @@all = []

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = transfer_amount

    @@all << self
  end

  def Transfer.all
    @@all
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount || valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @sender.balance > @amount && status == "pending"
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @receiver.deposit(@amount * -1)
      @sender.deposit(@amount)
      @status = 'reversed'
    end
  end
end
