class Ticket < ApplicationRecord
  belongs_to :customer
  belongs_to :trip
  belongs_to :seat

  enum status_buy: {not_buy: 0, buy: 1}, _prefix: :status
  enum status_cancel: {cancel: 0, activite: 1}, _prefix: :status

  scope :sorted, ->{order created_at: :desc}
  scope :join_customer, ->{joins :customer}
  scope :search_ticket, (lambda do |id, phone_number|
    if id.present?
      where("tickets.id = ?", id).where("customers.phone_number = ?", phone_number)
    else
      where("customers.phone_number = ?", phone_number) if phone_number.present?
    end  
  end)
end
