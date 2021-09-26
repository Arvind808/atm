module Error
  class InvalidAmountError < StandardError
    def message
      'Invalid ammount, Amount must be grater than zero.'
    end
  end
end
