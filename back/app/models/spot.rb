class Spot < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  mount_uploader :photo, ImageUploader
  has_many :reviews
end
