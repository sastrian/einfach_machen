class Pearl < ActiveRecord::Base  
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  mount_uploader :image, ImageUploader   
  is_impressionable
end
