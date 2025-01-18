class User < ApplicationRecord
  validates :name, presence: true
  # LINE IDは必須かつ一意
  validates :line_uid, presence: true, uniqueness: true 
  # メールは任意かつ一意
  validates :email, uniqueness: true, allow_nil: true  
end
