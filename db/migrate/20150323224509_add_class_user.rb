class AddClassUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :email, :string

      t.timestamp
    end

    add_column :questions, :user_id, :integer

  end


end
