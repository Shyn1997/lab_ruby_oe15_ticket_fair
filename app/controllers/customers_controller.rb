class CustomersController < ApplicationController
  def create
    check_customer_exist
  end

  def update
    @customer = Customer.find_by id: params[:id]
    @customer.tickets.each do |d|
      d.status_paid!
    end
    CustomerMailer.customer_email(@customer).deliver_now
    render "tickets/after_pay"
  end

  def check_customer_exist
    @customer = Customer.find_by(phone_number: params[:customer][:phone_number])

    if @customer.present?
      params[:customer][:tickets_attributes].each do |p|
        Ticket.create(trip_id: p[1][:trip_id], seat_id: p[1][:seat_id], customer_id: @customer.id)
      end
      render "tickets/pay"
    else
      @customer = Customer.new customer_params

      if @customer.save
        render "tickets/pay"
      else
        flash[:danger] = t ".full_information"
        redirect_back_or @customer
      end
    end
  end


  private

  def customer_params
    params.require(:customer).permit :name, :phone_number, :email,
      tickets_attributes: [:id, :trip_id, :bus_stop, :seat_id, :status]
  end
end
