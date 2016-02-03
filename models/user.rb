class User < ActiveRecord::Base
  belongs_to :buyable, polymorphic: true
end
