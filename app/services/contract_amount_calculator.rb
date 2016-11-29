class ContractAmountCalculator

  def self.total(:equipment, :discount)

    equipment.each do |equipment|
      total += equipment.category_amount.amount
    end

    total -= discount
  end

end
