class CustomersController < ApplicationController
  def create
    @customer = Customer.new customer_params
    if @customer.save
      render "tickets/pay"
    else
      flash[:danger] = t ".full_information"
      redirect_back_or @customer
    end
  end

  def update
    @customer = Customer.find_by id: params[:id]
    @customer.tickets.each do |d|
      d.status_paid!
    end
    CustomerMailer.customer_email(@customer).deliver_now
    render "tickets/after_pay"
  end

  private

  def customer_params
    params.require(:customer).permit :name, :phone_number, :email,
      tickets_attributes: [:id, :trip_id, :bus_stop, :seat_id, :status]
  end
end
