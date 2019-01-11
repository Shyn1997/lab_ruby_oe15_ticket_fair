class Ticket < ApplicationRecord
  belongs_to :customer
  belongs_to :trip
  belongs_to :seat

  TICKET_PARAMS = %i(id trip_id bus_stop seat_id status).freeze

  after_create :create_code

  enum status: {cancel: 0, paid: 1, pending: 2}, _prefix: :status

  scope :sorted, ->{order created_at: :desc}
  scope :join_customer, ->{joins :customer}
  scope :search_ticket, (lambda do |code, phone_number|
    if code
      where("tickets.code = ?", code).where("customers.phone_number = ?", phone_number)
    else
      where("customers.phone_number = ?", phone_number)
    end
  end)

  private

  def create_code
    update code: SecureRandom.alphanumeric(8).upcase.to_s
  end
end
