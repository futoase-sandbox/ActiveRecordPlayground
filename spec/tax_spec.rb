require_relative './spec_helper'

describe '#Tax' do
  it 'should be create tax for fruit' do
    fruit = Fruit.new
    fruit_taxe = fruit.taxes.new
    proc { fruit_taxe.save! }.must_be_silent
  end

  it 'shoudl be create tax for vegetable' do
    vegetable = Vegetable.new
    vegetable_taxe = vegetable.taxes.new
    proc { vegetable_taxe.save! }.must_be_silent
  end
end
