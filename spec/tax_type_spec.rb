require_relative './spec_helper'

describe '#TaxType' do
  it 'should be create tax type for fruit' do
    fruit = Fruit.new
    fruit_tax = fruit.taxes.new
    fruit_tax_type = fruit_tax.tax_types.new
    proc { fruit_tax_type.save! }.must_be_silent
  end

  it 'should be create tax type for vegetable' do
    vegetable = Vegetable.new
    vegetable_tax = vegetable.taxes.new
    vegetable_tax_type = vegetable_tax.tax_types.new
    proc { vegetable_tax_type.save! }.must_be_silent
    vegetable_tax_type.name.must_equal('eight')
  end

  it 'should be change tax type for fruit' do
    fruit = Fruit.new
    fruit.name = 'banana'
    fruit.price = 300
    fruit_tax = fruit.taxes.new
    fruit_tax_type = fruit_tax.tax_types.new
    fruit_tax_type.name = :five
    proc { fruit_tax_type.save! }.must_be_silent
    proc { fruit_tax.save! }.must_be_silent
    proc { fruit.save! }.must_be_silent

    fruit_record = Fruit.find_by(name: fruit.name)
    fruit_record.wont_equal(nil)
    fruit_record.name.must_equal('banana')
    fruit_record.price.must_equal(300)

    fruit_tax = Fruit.where(tax_typable: fruit_record.taxes)
    fruit_tax_type = TaxType.find_by(tax_id: fruit_tax_type.id)
    fruit_tax_type.wont_equal(nil)
    fruit_tax_type.name.must_equal('five')
  end
end
