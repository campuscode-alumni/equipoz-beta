require 'rails_helper'

RSpec.describe Contract, type: :model do
  it 'should be valid' do
    contract = Contract.create()
    expect(contract.errors[:customer]).to include("can't be blank")
    expect(contract.errors[:equipment]).to include("can't be blank")
  end
end
