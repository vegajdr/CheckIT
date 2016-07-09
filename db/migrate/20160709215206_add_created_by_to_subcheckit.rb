class AddCreatedByToSubcheckit < ActiveRecord::Migration
  def change
    add_column :subcheckits, :created_by, :integer
  end
end
