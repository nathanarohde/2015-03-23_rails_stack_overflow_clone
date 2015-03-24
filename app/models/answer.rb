class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :answerVotes, dependent: :destroy
  validates :content, :presence => true
end
