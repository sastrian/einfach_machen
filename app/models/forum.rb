class Forum < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  is_impressionable
  
  has_many :discussions, dependent: :destroy
  
  has_many :posts, :through => :discussions
  
end
