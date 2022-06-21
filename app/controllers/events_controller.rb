class EventsController < ApplicationController
    def index
        @events = Event.all
      end
    
      def new
        @event = Event.new
        if request.xhr?
          respond_to do |format|
              format.json {
                  render json: {locations: Location.where("city_id = ?",params[:city])}
              }
          end
        end
      end

      def create
        @event = Event.new(event_params)
        if @event.save
          redirect_to events_path
        else
          render :new, status: :unprocessable_entity
        end
      end
    
      def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to events_path
      end
    
      private
        def event_params
          params.require(:event).permit(:name, :start_time, :end_time, :location_id, :category_id)
        end   
end
