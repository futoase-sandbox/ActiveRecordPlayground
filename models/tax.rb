class Tax < ActiveRecord::Base
  belongs_to :tax_typable, polymorphic: true

  has_many :tax_types
end
