class CreateSubcheckits < ActiveRecord::Migration
  def change
    create_table :subcheckits do |t|
      t.string :name
      t.string :category

      t.timestamps null: false
    end
  end
end
