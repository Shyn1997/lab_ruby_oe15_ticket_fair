class Ticket < ApplicationRecord
  enum status: {cancel: 0, paid: 1, pending: 2}

  belongs_to :seat
  belongs_to :customer
  belongs_to :trip

  after_create :create_code

  private

  def create_code
    update code: SecureRandom.alphanumeric(8).upcase().to_s
  end
end
