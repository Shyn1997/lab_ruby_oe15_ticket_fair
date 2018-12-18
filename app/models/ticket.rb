class Ticket < ApplicationRecord
  belongs_to :customer
  belongs_to :trip

  enum status_buy: {not_buy: 0, buy: 1}, _prefix: :status
  enum status_cancel: {cancel: 0, activite: 1}, _prefix: :status

  scope :join_customer, ->{joins :customer}
  scope :search_ticket, (lambda do |id, phone_number|
    where("tickets.id = '#{id}' and customers.phone_number =
       '#{phone_number}'")
  end)
end
