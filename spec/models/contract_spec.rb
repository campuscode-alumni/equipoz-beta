require 'rails_helper'

RSpec.describe Contract, type: :model do
  it 'should be valid' do
    contract = Contract.create
    expect(contract.errors[:customer]).to include('must exist')
  end
  it { should validate_presence_of(:equipment) }
  it { should validate_presence_of(:rental_period) }
  it { should validate_presence_of(:delivery_address) }
  it { should validate_presence_of(:payment_method) }
  it { should validate_presence_of(:delivery_address) }
end
