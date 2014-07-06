class Discussion < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  
  has_many :posts
  
  is_impressionable
end
