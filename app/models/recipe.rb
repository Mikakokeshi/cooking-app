class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :title, :ingredients, :procedure, presence: true
  mount_uploader :image, ImageUploader
  ratyrate_rateable "recipe"
end
