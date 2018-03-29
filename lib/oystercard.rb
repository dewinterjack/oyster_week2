class OysterCard

  attr_reader :balance, :entry, :history

  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize()
    @balance = 0
    @entry = nil
    @history = []
  end

  def top_up(amount)
    raise max_message if @balance + amount > MAX_LIMIT
    @balance += amount
  end

  def touch_in(entry)
    raise "Balance is lower than mimimum (£1)" if @balance < MIN_FARE
    @entry = entry
  end

  def touch_out(exit)
    @history << { entry: @entry, exit: exit }
    @entry = nil
    deduct(MIN_FARE)
  end

  def in_journey?
    @entry == nil ? false : true
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def max_message
    "Max limit exceeded."
  end

end
