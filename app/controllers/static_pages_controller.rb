class StaticPagesController < ApplicationController
  def index
    respond_to do |format|
      format.html {}
      format.json{change_to_ajax}
    end
  end

  private

  def change_to_ajax
    @cities = City.city_names
    render json: @cities.to_json
  end
end
