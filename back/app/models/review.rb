class Review < ApplicationRecord
  belongs_to :spot
  # mount_uploader :image, ImageUploader
end
