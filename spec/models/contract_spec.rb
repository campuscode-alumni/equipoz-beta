require 'rails_helper'

RSpec.describe Contract, type: :model do
  it 'should be valid' do
    contract = Contract.create()
    expect(contract.errors[:customer]).to include("must exist")
  end
end
