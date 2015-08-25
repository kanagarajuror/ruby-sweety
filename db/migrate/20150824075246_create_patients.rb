class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :reading_value
      t.integer :user_id
      t.timestamps
    end
  end
end
