class User < ApplicationRecord
  validates :first_name, length: { minimum: 2, maximum: 25 }
  validates :last_name, length: { minimum: 2, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false },
                    length:  {maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
end