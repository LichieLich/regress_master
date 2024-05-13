class User < ApplicationRecord
  belongs_to :sack, optional: true
  has_many :duties
end
