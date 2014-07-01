class Pearl < ActiveRecord::Base  
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  mount_uploader :image, ImageUploader   
  is_impressionable
  
  scope :next, lambda {|id| where("id > ?",id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  def next
    Pearl.next(self.id).first
  end

  def previous
    Pearl.previous(self.id).first
  end
  
end
