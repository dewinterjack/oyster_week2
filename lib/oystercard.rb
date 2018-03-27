class OysterCard

  attr_reader :balance

  MAX_LIMIT = 90
  MIN_BALANCE = 1

  def initialize()
    @balance = 0
  end

  def top_up(amount)
    raise max_message if @balance + amount > MAX_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Balance is lower than mimimum (£1)" if @balance < MIN_BALANCE
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey
  end

  private

  def max_message
    "Max limit exceeded."
  end

end
