class answerVote < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :answer

end
