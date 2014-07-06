class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts
  has_many :discussions
  
  attr_accessor :login
                  
  validates_length_of :username, :minimum => 4, :allow_blank => false
  validates :username, presence: true
  validates :username, :uniqueness => { :case_sensitive => false}
  
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
end
