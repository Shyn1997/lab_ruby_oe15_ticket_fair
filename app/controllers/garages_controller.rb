class GaragesController < ApplicationController
  before_action :check_datetime, only: :index
  before_action :downcase_params, only: :index

  def index
    @garages = Garage.search_garage params[:city_start], params[:city_end],
      Date.parse(params[:time_start])
    @trips = Trip.search_trip params[:city_start], params[:city_end],
      params[:time_start]
    @customer = Customer.new
    @customer.tickets.new
    store_location

    return if @garages
    flash.now["success"] = t".no_garage"
    render :index
  end

  private

  def downcase_params
    params[:city_start].downcase!
    params[:city_end].downcase!
  end


  def check_datetime
    return if params[:time_start].present?
    flash[:danger] = t ".insert_date"
    redirect_to root_url
  end
end
