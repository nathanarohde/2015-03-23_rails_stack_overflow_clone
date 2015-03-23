class AddQuestionAndAnswer < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :title, :string
      t.column :content, :text

      t.timestamp
    end

    create_table :answers do |t|
      t.column :content, :text
      t.references :question

      t.timestamp
    end
  end
end
