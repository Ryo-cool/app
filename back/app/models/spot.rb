class Spot < ApplicationRecord
  belongs_to_active_hash :prefecture
  mount_uploader :photo, ImageUploader
  has_many :reviews
end
