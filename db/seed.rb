require_relative '../spec/spec_helper'
require_relative './schema'

module Seed
  def self.build
    ActiveRecord::Base.transaction do
      apple = Fruit.new(name: 'apple',  price: 300)
      apple.save!
      apple_tax = apple.taxes.new
      apple_tax_type = apple_tax.tax_types.new
      apple_tax_type.name = :eight
      orange = Fruit.new(name: 'orange', price: 150)
      orange.save!

      tomato = Vegetable.new(name: 'tomato', price: 200)
      tomato.save!
      radish = Vegetable.new(name: 'radish', price: 100)
      radish.save!

      User.create(name: 'tom',    mail: 'tom@example.com')
      User.create(name: 'arice',  mail: 'alice@example.com')
    end
  end
end

if __FILE__ == $0
  Seed.build
end
