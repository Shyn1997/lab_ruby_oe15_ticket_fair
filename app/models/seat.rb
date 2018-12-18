class Seat < ApplicationRecord
  belongs_to :coach
  has_one :ticket
end
