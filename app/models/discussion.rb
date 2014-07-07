class Discussion < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  
  has_many :posts, dependent: :destroy
  
  is_impressionable
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates_length_of :title, :minimum => 5
end
