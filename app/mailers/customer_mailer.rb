class CustomerMailer < ApplicationMailer
  def customer_email customer, tickets
    @customer = customer
    @tickets = tickets
    mail to: @customer.email, subject: "Email"
  end
end
