class AmountConversionService
  attr_reader :convertions, :input_amount

  UNITS = {
    quarter: 25,
    dime: 10,
    nickel: 5,
    penny: 1
  }.freeze

  def initialize(input_amount)
    @input_amount = input_amount.to_i
    @convertions = {}

    raise Error::InvalidAmountError if @input_amount <= 0

    dispense
  end

  def dispense
    count(input_amount, :quarter)
  end

  private

  def count(amount, unit)
    return if amount.zero?

    res = amount / UNITS[unit]
    if res.positive?
      @convertions[unit] = res
      amount = amount % UNITS[unit]
    end

    count(amount, select_unit(amount))
  end

  def select_unit(amount)
    case amount
    when (25..)
      :quarter
    when 10...25
      :dime
    when 5...10
      :nickel
    when 1...5
      :penny
    end
  end
end
