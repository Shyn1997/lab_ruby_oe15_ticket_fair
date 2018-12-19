class CustomersController < ApplicationController
  def create
    @customers = Customer.new customer_params

    if @customers.save
      render json: @customers
    else
      flash[:danger] = "Điền đầy đủ thông tin"
      redirect_back_or @customers
    end
  end

  private

  def customer_params
    params.require(:customer).permit :name, :phone_number, :email, :bus_stop,
      tickets_attributes: [:id, :trip_id, :seat_id, :status]
    end
end
