class Location < ApplicationRecord
  belongs_to :city
  has_many :events, dependent: :destroy
end
