class User < ApplicationRecord
  validates :username, precense: true, 
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, precense: true, 
                    uniqueness: { case_sensitive: false },
                    length:  {maximum: 105 },
                    formate: { with: VALID_EMAIL_REGEX }
end