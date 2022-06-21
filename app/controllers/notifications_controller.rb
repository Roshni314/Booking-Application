class NotificationsController < ApplicationController
    def index
        @notifications = Notification.all
      end
    
      def new
        @notification = Notification.new
      end

      def create
        @notification = Notification.new(notification_params)
        if @notification.save
          redirect_to notifications_path
        else
          render :new, status: :unprocessable_entity
        end
      end
     
      def destroy
        @notification = Notification.find(params[:id])
        @notification.destroy
        redirect_to root_path
      end
    
      private
        def notification_params
          params.require(:notification).permit(:notifiable_type, :notifiable_id, :message)
        end    
end
