class BusStation < ApplicationRecord
  belongs_to :city
  has_many :stop_points, dependent: :destroy
end
