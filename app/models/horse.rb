class Horse < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address_and_level,
    against: [:address, :level],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  # validates :name, presence: true
  # validates :address, presence: true
  # validates :price, presence: true
end
