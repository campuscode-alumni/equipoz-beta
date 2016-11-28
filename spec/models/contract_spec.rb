require 'rails_helper'

RSpec.describe Contract, type: :model do
  it 'should be valid' do
    contract = Contract.create
    expect(contract.errors[:customer]).to include('deve existir')
  end
  it { should validate_presence_of(:equipment) }
  it { should validate_presence_of(:rental_period) }
  it { should validate_presence_of(:delivery_address) }
  it { should validate_presence_of(:payment_method) }
  it { should validate_presence_of(:delivery_address) }

  describe '#contract_code' do
    before do
      @time_number = Time.now.to_datetime.to_i
      @contract = create(:contract, created_at: @time_number)
    end

    it 'should return correct contract code' do
      expect(@contract.contract_code).to eq(@time_number + @contract.id)
    end
  end
end
