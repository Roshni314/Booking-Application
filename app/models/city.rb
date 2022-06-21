class City < ApplicationRecord
    has_many :locations, dependent: :destroy
end
