class User < ApplicationRecord
    has_many :bookings, dependent: :destroy
    has_many :events, through: :booking
    has_and_belongs_to_many :roles
end
