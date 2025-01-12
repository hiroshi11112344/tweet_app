class User < ApplicationRecord
  validates :line_uid, uniqueness: true
end
