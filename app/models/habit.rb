class Habit < ApplicationRecord
  belongs_to :goal
  has_many :scores, dependent: :destroy
end
