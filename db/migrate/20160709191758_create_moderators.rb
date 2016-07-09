class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :subcheckit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
