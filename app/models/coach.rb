class Coach < ApplicationRecord
  belongs_to :garage
  has_many :trips, dependent: :destroy
  has_many :seats, dependent: :destroy
end
