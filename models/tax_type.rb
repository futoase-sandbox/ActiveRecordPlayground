class TaxType < ActiveRecord::Base
  extend Enumerize

  belongs_to :tax

  enumerize :name, in: [:five, :eight, :ten], default: :eight

  def rate
    {five: 5.0, eight: 8.0, ten: 10.0}
  end

  def percent
    return rate[name.to_sym]
  end
end
