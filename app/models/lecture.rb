class Lecture < ApplicationRecord
  belongs_to :conference
  belongs_to :track
  validates :description, presence: true
  validates :description, length: { minimum: 3, maximum: 200 }
end
