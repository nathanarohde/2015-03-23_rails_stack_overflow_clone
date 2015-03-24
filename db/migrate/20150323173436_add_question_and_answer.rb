class AddQuestionAndAnswer < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :email, :string

      t.timestamp
    end

    create_table :questions do |t|
      t.column :title, :string
      t.column :content, :text
      t.references :user

      t.timestamp
    end

    create_table :answers do |t|
      t.column :content, :text
      t.references :question

      t.timestamp
    end

  end
end
