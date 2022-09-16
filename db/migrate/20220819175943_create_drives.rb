class CreateDrives < ActiveRecord::Migration[7.0]
  def change
    create_table :drives do |t|
      t.string :drive_date
      t.string :role
      t.timestamps
    end
  end
end
