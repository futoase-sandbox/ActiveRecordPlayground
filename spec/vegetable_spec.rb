require_relative './spec_helper'

describe '#Vegetable' do
  it 'should be added new vegetable' do
    cabbage = Vegetable.new
    cabbage.name = 'cabbage'
    cabbage.price = 200
    proc { cabbage.save! }.must_be_silent

    cabbage_taxes = cabbage.taxes.new
    cabbage_tax_type = cabbage_taxes.tax_types.new
    cabbage_tax_type.name = :eight
    proc { cabbage_tax_type.save! }.must_be_silent

    record = Vegetable.find_by(name: cabbage.name)
    record.nil?.wont_equal true
    record.taxes.nil?.wont_equal true
    record.taxes.find_by(
      tax_typable: cabbage.id
    ).id.must_equal cabbage.id
  end
end
