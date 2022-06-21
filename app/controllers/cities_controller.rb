class CitiesController < ApplicationController
    def index
        @cities = City.all
      end
    
      def new
        @city = City.new
      end

      def create
        @city = City.new(city_params)
        if @city.save
          redirect_to cities_path
        else
          render :new, status: :unprocessable_entity
        end
      end
    
      def destroy
        @city = City.find(params[:id])
        @city.destroy
        redirect_to cities_path
      end
    
      private
        def city_params
          params.require(:city).permit(:name)
        end
    
end
