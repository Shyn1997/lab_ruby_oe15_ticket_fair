module Admin
  class GaragesController < Admin::BaseController
    def index
      @title = "Nhà xe"
      @garages = Garage.all
    end

    def new; end
  end
end
