class Spot < ApplicationRecord
  belongs_to_active_hash :prefecture
  has_many :reviews
end
