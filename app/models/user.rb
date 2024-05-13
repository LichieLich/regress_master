class User < ApplicationRecord
  belongs_to :sack
  has_many :duties
end
