class Trip < ApplicationRecord
  belongs_to :coach
  has_many :stop_points, dependent: :destroy
  has_many :tickets, dependent: :destroy
end
