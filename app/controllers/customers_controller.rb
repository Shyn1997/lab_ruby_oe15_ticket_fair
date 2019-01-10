class CustomersController < ApplicationController
  def create
    check_customer_exist
  end

  def update
<<<<<<< HEAD
    @customer = Customer.find_by id: params[:id]
    @customer.tickets.each do |d|
      d.status_paid!
    end
    CustomerMailer.customer_email(@customer).deliver_now
    render "tickets/after_pay"
=======
>>>>>>> 21bcf78e28ef1da473f44c842a4dad93d93af65b
  end

  def check_customer_exist
    @customer = Customer.find_by(phone_number: params[:customer][:phone_number])

    if @customer.present?
<<<<<<< HEAD
      params[:customer][:tickets_attributes].each do |p|
        Ticket.create(trip_id: p[1][:trip_id], seat_id: p[1][:seat_id], customer_id: @customer.id)
=======
      @tickets = []
      @id_tickets = []
      params[:customer][:tickets_attributes].each do |p|
        @ticket = Ticket.create(trip_id: p[1][:trip_id], seat_id: p[1][:seat_id], customer_id: @customer.id)
        @id_tickets << @ticket.id
        @tickets << @ticket
>>>>>>> 21bcf78e28ef1da473f44c842a4dad93d93af65b
      end
      render "tickets/pay"
    else
      @customer = Customer.new customer_params

      if @customer.save
<<<<<<< HEAD
=======
        @tickets = @customer.tickets
        @id_tickets = @tickets.map { |t| t.id }
>>>>>>> 21bcf78e28ef1da473f44c842a4dad93d93af65b
        render "tickets/pay"
      else
        flash[:danger] = t ".full_information"
        redirect_back_or @customer
      end
    end
  end

<<<<<<< HEAD

=======
>>>>>>> 21bcf78e28ef1da473f44c842a4dad93d93af65b
  private

  def customer_params
    params.require(:customer).permit :name, :phone_number, :email,
      tickets_attributes: [:id, :trip_id, :bus_stop, :seat_id, :status]
  end
end
