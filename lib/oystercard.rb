class OysterCard

  attr_reader :balance

  MAX_LIMIT = 90

  def initialize()
    @balance = 0
  end

  def top_up(amount)
    raise max_message if @balance + amount > MAX_LIMIT
    @balance += amount
  end

  private

  def max_message
    "Max limit exceeded."
  end

end
