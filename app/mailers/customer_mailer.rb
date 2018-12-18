class CustomerMailer < ApplicationMailer
  def customer_email customer
    @customer = customer
    mail to: @customer.email, subject: "Email"
  end
end
