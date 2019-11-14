class Horse < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # validates :name, presence: true
  # validates :address, presence: true
  # validates :price, presence: true
end
