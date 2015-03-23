class User < ActiveRecord::Base
  has_many :questions
  validates :name, presence => true
  validates :email, presence => true
end
