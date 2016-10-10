class Gallery < ApplicationRecord
  mount_uploaders :images, ImageUploader

  # validates :images, presence: true
  validates_uniqueness_of :is_shown, if: :is_shown, message: 'Csak egy galéria lehet megjelenítve!'
end
