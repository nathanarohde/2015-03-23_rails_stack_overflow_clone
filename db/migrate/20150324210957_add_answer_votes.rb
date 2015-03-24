class AddAnswerVotes < ActiveRecord::Migration
  def change
    create_table :answerVotes do |t|
      t.column :total, :integer
      t.references :answer
    end

    create_table :answerVotes_users, id: false do |t|
      t.belongs_to :answerVote, index: true
      t.belongs_to :user, index: true
    end

  end
end
