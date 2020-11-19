class Spot < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_one_attached :image
  # mount_uploader :photo, ImageUploader
  has_many :reviews

  validates :name,presence: true

  def image_url
    # 紐づいている画像のURLを取得する
    image.attached? ? url_for(image) : nil
  end
  
end
