class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :title, :content, presence: true
end