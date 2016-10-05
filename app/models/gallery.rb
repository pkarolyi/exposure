class Gallery < ApplicationRecord
  mount_uploaders :images, ImageUploader

  validates :images, presence: true
end
