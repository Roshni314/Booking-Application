class Event < ApplicationRecord
  belongs_to :location
  belongs_to :category
  has_many  :users, through: :booking
  has_many :bookings, dependent: :destroy
  has_many :notifications, as: :notifiable

  after_create :create_notification

  private
    def create_notification
      self.notifications.create(message:"#{self.name} event created.")
    end
end
