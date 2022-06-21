class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event 
  has_many :notifications, as: :notifiable

  enum status: { "pending":0 , "confirmed":1, "cancelled":2 }

  after_create :create_notification
  after_update :update_notification
  private
    def create_notification
      self.notifications.create(message:"#{self.event.name} booking #{self.status}.")
    end
    
    def update_notification
      self.notifications.update(message:"#{self.event.name} booking #{self.status}.")
    end

end
