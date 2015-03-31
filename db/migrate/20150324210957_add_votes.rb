class AddVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.column :total, :integer
      t.references :voteable, polymorphic: true, index: true
    end
  end
end
