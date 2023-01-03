class Track < ApplicationRecord
  belongs_to :conference
  validates :description, presence: true
  validates :description, length: { minimum: 3, maximum: 100 }
end
