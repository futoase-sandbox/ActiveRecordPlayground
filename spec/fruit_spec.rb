require_relative './spec_helper'

describe '#Fruit' do
  it 'should be added new fruit' do
    persimmon = Fruit.new
    persimmon.name = 'persimmon'
    persimmon.price = 300
    proc { persimmon.save! }.must_be_silent

    persimmon_taxes = persimmon.taxes.new
    persimmon_tax_type = persimmon_taxes.tax_types.new
    persimmon_tax_type.name = :eight
    proc { persimmon_tax_type.save! }.must_be_silent

    record = Fruit.find_by(name: persimmon.name)
    record.nil?.wont_equal true
    record.taxes.nil?.wont_equal true
    record.taxes.find_by(
      tax_typable: persimmon_taxes.id
    ).id.must_equal persimmon.id
  end
end

