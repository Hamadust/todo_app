class Task < ApplicationRecord
  validates :state,   presence: true
  validates :limit,   presence: true
  validates :content, presence: true, length: { maximum: 50 }
end
