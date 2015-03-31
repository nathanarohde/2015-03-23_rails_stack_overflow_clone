class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, :as => :voteable, dependent: :destroy
  has_many :answers, dependent: :destroy
  validates :title, :presence => true
  validates :content, :presence => true
end
