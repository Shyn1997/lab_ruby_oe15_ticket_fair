class GaragesController < ApplicationController
  before_action :check_datetime, only: :index

  def index
    @garages = Garage.search_garage params[:city_start], params[:city_end],
      Date.parse(params[:time_start])
    @trips = Trip.search_trip params[:city_start], params[:city_end],
      params[:time_start]
    @customer = Customer.new
    @customer.tickets.new
    store_location
  end

  private

  def check_datetime
    return if params[:time_start].present?
    flash[:danger] = t ".insert_date"
    redirect_to root_url
  end
end
