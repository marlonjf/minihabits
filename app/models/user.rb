class User < ApplicationRecord
  has_many :habits, dependent: :destroy
end
