class User < ApplicationRecord
  # gem bcrypt
  has_secure_password

  validates :name, presence: true,
    user.errors.add(:name, :too_long, count: 30)
  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
  validates :password, presence: true,
                        length: { minimum: 8 },
                        format: {
                          with: VALID_PASSWORD_REGEX
                          message: :invalid_password
                        },
                        allow_blank: true
end
