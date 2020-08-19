class Thought < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :text, presence: true, length: { minimum: 5, maximum: 1000 }

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
