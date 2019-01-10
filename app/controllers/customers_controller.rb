class CustomersController < ApplicationController
  def create
    check_customer_exist
  end

  def update
  end

  def check_customer_exist
    @customer = Customer.find_by(phone_number: params[:customer][:phone_number])

    if @customer.present?
      @tickets = []
      @id_tickets = []
      params[:customer][:tickets_attributes].each do |p|
        @ticket = Ticket.create(trip_id: p[1][:trip_id], seat_id: p[1][:seat_id], customer_id: @customer.id)
        @id_tickets << @ticket.id
        @tickets << @ticket
      end
      render "tickets/pay"
    else
      @customer = Customer.new customer_params

      if @customer.save
        @tickets = @customer.tickets
        @id_tickets = @tickets.map { |t| t.id }
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
