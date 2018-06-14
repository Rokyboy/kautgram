class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.integer :user_id, :integer
      t.integer :follow_id, :integer

      t.timestamps
    end
  end
end
