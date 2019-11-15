class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :horse
end
