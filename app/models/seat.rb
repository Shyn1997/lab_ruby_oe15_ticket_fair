class Seat < ApplicationRecord
  belongs_to :coach
  has_many :tickets
end
