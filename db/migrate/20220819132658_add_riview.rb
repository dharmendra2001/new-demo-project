class AddRiview < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :riview, :string
    # add_column :candidates, :drive_date, :string
    # add_column :candidates, :role, :string
  end
end
