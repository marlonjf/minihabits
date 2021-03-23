class Habit < ApplicationRecord
  belongs_to :user
  has_many :scores, dependent: :destroy
end
