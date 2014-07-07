class Discussion < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  
  has_many :posts, dependent: :destroy
  
  is_impressionable
  
  extend FriendlyId
  friendly_id :title, use: :slugged
end
