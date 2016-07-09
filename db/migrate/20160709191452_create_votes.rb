class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :vote
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
