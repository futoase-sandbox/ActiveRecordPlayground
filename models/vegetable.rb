class Vegetable < ActiveRecord::Base
  has_many :taxes, as: :tax_typable
end
