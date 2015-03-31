class User < ActiveRecord::Base
  has_many :votes, :as => :voteable
  has_many :questions
  validates :name, presence: true
  validates_uniqueness_of :name
  validates :email, presence: true
  validates_uniqueness_of :email

  def self.authenticate(name)
    user = User.where(name: name).first
    if user
      user
    else
      nil
    end
  end

end
